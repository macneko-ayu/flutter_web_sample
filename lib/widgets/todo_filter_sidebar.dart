import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/models/todo.dart';
import 'package:flutter_web_sample/models/todo_filter.dart';
import 'package:flutter_web_sample/providers/todo_provider.dart';

class TodoFilterSidebar extends ConsumerWidget {
  const TodoFilterSidebar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _FilterSection(
          title: 'ステータス',
          child: _CompletionFilter(),
        ),
        _FilterSection(
          title: '優先度',
          child: _PriorityFilter(),
        ),
        _FilterSection(
          title: '並び替え',
          child: _SortingOptions(),
        ),
        _FilterSection(
          title: 'タグ',
          child: _TagFilter(),
        ),
      ],
    );
  }
}

class _FilterSection extends StatelessWidget {
  const _FilterSection({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _CompletionFilter extends ConsumerWidget {
  const _CompletionFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoFilterStateProvider);

    return SegmentedButton<bool?>(
      segments: const [
        ButtonSegment(value: null, label: Text('全て')),
        ButtonSegment(value: false, label: Text('未完了')),
        ButtonSegment(value: true, label: Text('完了')),
      ],
      selected: {filter.isCompleted},
      onSelectionChanged: (values) {
        ref.read(todoFilterStateProvider.notifier).updateFilter(
          (state) => state.copyWith(isCompleted: values.first),
        );
      },
    );
  }
}

class _PriorityFilter extends ConsumerWidget {
  const _PriorityFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoFilterStateProvider);

    return Wrap(
      spacing: 8,
      children: [
        FilterChip(
          label: const Text('全て'),
          selected: filter.priority == null,
          onSelected: (selected) {
            ref.read(todoFilterStateProvider.notifier).updateFilter(
              (state) => state.copyWith(priority: null),
            );
          },
        ),
        ...Priority.values.map(
          (priority) => FilterChip(
            label: Text(_getPriorityLabel(priority)),
            selected: filter.priority == priority,
            onSelected: (selected) {
              ref.read(todoFilterStateProvider.notifier).updateFilter(
                (state) => state.copyWith(
                  priority: selected ? priority : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _getPriorityLabel(Priority priority) {
    return switch (priority) {
      Priority.high => '高',
      Priority.medium => '中',
      Priority.low => '低',
    };
  }
}

class _SortingOptions extends ConsumerWidget {
  const _SortingOptions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoFilterStateProvider);

    return Column(
      children: [
        DropdownButtonFormField<TodoSortBy>(
          value: filter.sortBy,
          items: TodoSortBy.values.map((sortBy) {
            return DropdownMenuItem(
              value: sortBy,
              child: Text(_getSortByLabel(sortBy)),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              ref.read(todoFilterStateProvider.notifier).updateFilter(
                (state) => state.copyWith(sortBy: value),
              );
            }
          },
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text('降順'),
          value: filter.sortDescending,
          onChanged: (value) {
            ref.read(todoFilterStateProvider.notifier).updateFilter(
              (state) => state.copyWith(sortDescending: value),
            );
          },
        ),
      ],
    );
  }

  String _getSortByLabel(TodoSortBy sortBy) {
    return switch (sortBy) {
      TodoSortBy.dueDate => '期限',
      TodoSortBy.createdAt => '作成日時',
      TodoSortBy.priority => '優先度',
      TodoSortBy.title => 'タイトル',
    };
  }
}

class _TagFilter extends ConsumerWidget {
  const _TagFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoFilterStateProvider);
    final todos = ref.watch(todoListProvider);

    // すべてのTODOからタグを収集
    final allTags = todos.when(
      data: (todos) {
        return todos.expand((todo) => todo.tags).toSet().toList();
      },
      loading: () => <String>[],
      error: (_, __) => <String>[],
    );

    if (allTags.isEmpty) {
      return const Text('タグがありません');
    }

    return Wrap(
      spacing: 8,
      children: allTags.map((tag) {
        final isSelected = filter.tags?.contains(tag) ?? false;
        return FilterChip(
          label: Text(tag),
          selected: isSelected,
          onSelected: (selected) {
            final currentTags = filter.tags?.toList() ?? [];
            if (selected) {
              currentTags.add(tag);
            } else {
              currentTags.remove(tag);
            }
            ref.read(todoFilterStateProvider.notifier).updateFilter(
              (state) => state.copyWith(
                tags: currentTags.isEmpty ? null : currentTags,
              ),
            );
          },
        );
      }).toList(),
    );
  }
} 