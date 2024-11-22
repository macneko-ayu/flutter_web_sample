import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/models/todo.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: TodoProviderの実装後に更新
    final todos = <Todo>[];

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoListTile(todo: todo);
      },
    );
  }
}

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) {
          // TODO: 完了状態の更新処理
        },
      ),
      title: Text(todo.title),
      subtitle: todo.description != null ? Text(todo.description!) : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (todo.dueDate != null)
            Chip(
              label: Text(todo.dueDate.toString()),
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // TODO: メニューの表示
            },
          ),
        ],
      ),
    );
  }
} 