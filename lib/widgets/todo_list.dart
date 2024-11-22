import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/models/todo.dart';
import 'package:flutter_web_sample/providers/todo_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_web_sample/screens/todo_form_screen.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodosProvider);

    if (todos.isEmpty) {
      return const Center(
        child: Text('TODOがありません'),
      );
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoListTile(todo: todo);
      },
    );
  }
}

class TodoListTile extends ConsumerWidget {
  const TodoListTile({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            ref.read(todoListProvider.notifier).toggleTodoCompletion(todo.id);
          },
        ),
        title: Text(
          todo.title,
          style: textTheme.titleMedium?.copyWith(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (todo.description != null) ...[
              const SizedBox(height: 4),
              Text(todo.description!),
            ],
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _PriorityChip(priority: todo.priority),
                if (todo.dueDate != null)
                  Chip(
                    label: Text(
                      DateFormat.yMMMd().format(todo.dueDate!),
                    ),
                    backgroundColor: _getDueDateColor(todo.dueDate!, colorScheme),
                  ),
                ...todo.tags.map((tag) => Chip(label: Text(tag))),
              ],
            ),
          ],
        ),
        onTap: () {
          ref.read(selectedTodoProvider.notifier).select(todo);
        },
        trailing: PopupMenuButton<String>(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Text('編集'),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('削除'),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 'edit':
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TodoFormScreen(todo: todo),
                  ),
                );
                break;
              case 'delete':
                ref.read(todoListProvider.notifier).removeTodo(todo.id);
                break;
            }
          },
        ),
      ),
    );
  }

  Color _getDueDateColor(DateTime dueDate, ColorScheme colorScheme) {
    final now = DateTime.now();
    if (dueDate.isBefore(now)) {
      return colorScheme.error.withOpacity(0.2);
    } else if (dueDate.difference(now).inDays <= 3) {
      return colorScheme.errorContainer.withOpacity(0.2);
    }
    return colorScheme.surface;
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