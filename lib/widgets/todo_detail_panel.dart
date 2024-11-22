import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_sample/models/todo.dart';

class TodoDetailPanel extends ConsumerWidget {
  const TodoDetailPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: 選択されたTODOの取得
    final selectedTodo = null;

    if (selectedTodo == null) {
      return const Center(
        child: Text('TODOを選択してください'),
      );
    }

    return const Placeholder();
  }
} 