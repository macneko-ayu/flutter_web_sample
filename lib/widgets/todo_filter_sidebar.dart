import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/models/todo.dart';
import 'package:flutter_web_sample/models/todo_filter.dart';

class TodoFilterSidebar extends ConsumerWidget {
  const TodoFilterSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const _FilterSection(
          title: 'ステータス',
          child: _CompletionFilter(),
        ),
        const _FilterSection(
          title: '優先度',
          child: _PriorityFilter(),
        ),
        const _FilterSection(
          title: '並び替え',
          child: _SortingOptions(),
        ),
        const _FilterSection(
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
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}

// TODO: 各フィルターコンポーネントの実装
class _CompletionFilter extends ConsumerWidget {
  const _CompletionFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder(
      fallbackHeight: 50,
    );
  }
}

class _PriorityFilter extends ConsumerWidget {
  const _PriorityFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder(
      fallbackHeight: 100,
    );
  }
}

class _SortingOptions extends ConsumerWidget {
  const _SortingOptions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder(
      fallbackHeight: 100,
    );
  }
}

class _TagFilter extends ConsumerWidget {
  const _TagFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder(
      fallbackHeight: 100,
    );
  }
} 