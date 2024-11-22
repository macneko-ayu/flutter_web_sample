import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/models/todo.dart';
import 'package:flutter_web_sample/providers/todo_provider.dart';
import 'package:flutter_web_sample/screens/todo_form_screen.dart';
import 'package:intl/intl.dart';

class TodoDetailPanel extends ConsumerWidget {
  const TodoDetailPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTodo = ref.watch(selectedTodoProvider);

    if (selectedTodo == null) {
      return const Center(
        child: Text('TODOを選択してください'),
      );
    }

    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  selectedTodo.title,
                  style: textTheme.headlineSmall,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TodoFormScreen(todo: selectedTodo),
                    ),
                  );
                },
              ),
            ],
          ),
          const Divider(),
          if (selectedTodo.description != null) ...[
            const SizedBox(height: 16),
            Text(
              '説明',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(selectedTodo.description!),
          ],
          const SizedBox(height: 16),
          _DetailItem(
            label: '優先度',
            child: _PriorityChip(priority: selectedTodo.priority),
          ),
          if (selectedTodo.dueDate != null)
            _DetailItem(
              label: '期限',
              child: Text(DateFormat.yMMMd().format(selectedTodo.dueDate!)),
            ),
          _DetailItem(
            label: '作成日時',
            child: Text(DateFormat.yMMMd().add_Hm().format(selectedTodo.createdAt)),
          ),
          _DetailItem(
            label: '更新日時',
            child: Text(DateFormat.yMMMd().add_Hm().format(selectedTodo.updatedAt)),
          ),
          if (selectedTodo.tags.isNotEmpty)
            _DetailItem(
              label: 'タグ',
              child: Wrap(
                spacing: 8,
                children: selectedTodo.tags
                    .map((tag) => Chip(label: Text(tag)))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  const _DetailItem({
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class _PriorityChip extends StatelessWidget {
  const _PriorityChip({required this.priority});

  final Priority priority;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    final (color, label) = switch (priority) {
      Priority.high => (colorScheme.error, '高'),
      Priority.medium => (colorScheme.primary, '中'),
      Priority.low => (colorScheme.secondary, '低'),
    };

    return Chip(
      label: Text(label),
      backgroundColor: color.withOpacity(0.2),
      labelStyle: TextStyle(color: color),
    );
  }
} 