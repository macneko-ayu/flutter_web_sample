import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_web_sample/models/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository.g.dart';

class TodoRepository {
  static const _todoKey = 'todos';

  Future<List<Todo>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = prefs.getStringList(_todoKey) ?? [];
    return todosJson
        .map((json) => Todo.fromJson(jsonDecode(json) as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = todos
        .map((todo) => jsonEncode(todo.toJson()))
        .toList();
    await prefs.setStringList(_todoKey, todosJson);
  }
}

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepository();
}

@riverpod
Future<List<Todo>> initialTodos(InitialTodosRef ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return repository.loadTodos();
} 