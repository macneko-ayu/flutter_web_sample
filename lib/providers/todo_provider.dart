import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_web_sample/models/todo.dart';
import 'package:flutter_web_sample/models/todo_filter.dart';
import 'package:flutter_web_sample/repositories/todo_repository.dart';

part 'todo_provider.g.dart';

@Riverpod(keepAlive: true)
class TodoList extends _$TodoList {
  @override
  FutureOr<List<Todo>> build() async {
    final repository = ref.watch(todoRepositoryProvider);
    return repository.loadTodos();
  }

  Future<void> addTodo(Todo todo) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentTodos = <Todo>[...(state.value ?? []), todo];
      await ref.read(todoRepositoryProvider).saveTodos(currentTodos);
      return currentTodos;
    });
  }

  Future<void> removeTodo(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentTodos = (state.value ?? []).where((todo) => todo.id != id).toList();
      await ref.read(todoRepositoryProvider).saveTodos(currentTodos);
      return currentTodos;
    });
  }

  Future<void> updateTodo(Todo todo) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentTodos = (state.value ?? []).map((t) => t.id == todo.id ? todo : t).toList();
      await ref.read(todoRepositoryProvider).saveTodos(currentTodos);
      return currentTodos;
    });
  }

  Future<void> toggleTodoCompletion(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentTodos = (state.value ?? []).map((todo) {
        if (todo.id == id) {
          return todo.copyWith(
            isCompleted: !todo.isCompleted,
            updatedAt: DateTime.now(),
          );
        }
        return todo;
      }).toList();
      await ref.read(todoRepositoryProvider).saveTodos(currentTodos);
      return currentTodos;
    });
  }
}

@riverpod
class FilteredTodos extends _$FilteredTodos {
  @override
  List<Todo> build() {
    final filter = ref.watch(todoFilterStateProvider);
    final todosAsync = ref.watch(todoListProvider);
    
    return todosAsync.when(
      data: (todos) => _filterTodos(todos, filter),
      loading: () => [],
      error: (_, __) => [],
    );
  }

  List<Todo> _filterTodos(List<Todo> todos, TodoFilter filter) {
    var filteredTodos = todos;

    if (filter.searchQuery?.isNotEmpty ?? false) {
      filteredTodos = filteredTodos.where((todo) {
        return todo.title.toLowerCase().contains(filter.searchQuery!.toLowerCase()) ||
            (todo.description?.toLowerCase().contains(filter.searchQuery!.toLowerCase()) ?? false);
      }).toList();
    }

    if (filter.isCompleted != null) {
      filteredTodos = filteredTodos.where((todo) => todo.isCompleted == filter.isCompleted).toList();
    }

    if (filter.priority != null) {
      filteredTodos = filteredTodos.where((todo) => todo.priority == filter.priority).toList();
    }

    if (filter.tags?.isNotEmpty ?? false) {
      filteredTodos = filteredTodos.where((todo) {
        return todo.tags.any((tag) => filter.tags!.contains(tag));
      }).toList();
    }

    filteredTodos.sort((a, b) {
      final comparison = switch (filter.sortBy) {
        TodoSortBy.dueDate => (a.dueDate ?? DateTime(9999)).compareTo(b.dueDate ?? DateTime(9999)),
        TodoSortBy.createdAt => a.createdAt.compareTo(b.createdAt),
        TodoSortBy.priority => a.priority.index.compareTo(b.priority.index),
        TodoSortBy.title => a.title.compareTo(b.title),
      };
      return filter.sortDescending ? -comparison : comparison;
    });

    return filteredTodos;
  }
}

@riverpod
class SelectedTodo extends _$SelectedTodo {
  @override
  Todo? build() => null;

  void select(Todo? todo) {
    state = todo;
  }
}

// フィルター状態を管理する単純なプロバイダー
@riverpod
class TodoFilterState extends _$TodoFilterState {
  @override
  TodoFilter build() {
    return const TodoFilter();
  }

  void updateFilter(TodoFilter Function(TodoFilter) update) {
    state = update(state);
  }
} 