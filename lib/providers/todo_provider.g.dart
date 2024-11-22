// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoListHash() => r'2db0bc135cc1a871e0cfe45fccbc4471c0ecf246';

/// See also [TodoList].
@ProviderFor(TodoList)
final todoListProvider = AsyncNotifierProvider<TodoList, List<Todo>>.internal(
  TodoList.new,
  name: r'todoListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoList = AsyncNotifier<List<Todo>>;
String _$filteredTodosHash() => r'2fda975841af973a4e7bbc75f8c0cbfa228d4bab';

/// See also [FilteredTodos].
@ProviderFor(FilteredTodos)
final filteredTodosProvider =
    AutoDisposeNotifierProvider<FilteredTodos, List<Todo>>.internal(
  FilteredTodos.new,
  name: r'filteredTodosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilteredTodos = AutoDisposeNotifier<List<Todo>>;
String _$selectedTodoHash() => r'11c0a4e7e7de890b70eda72f2834330ba8a0c762';

/// See also [SelectedTodo].
@ProviderFor(SelectedTodo)
final selectedTodoProvider =
    AutoDisposeNotifierProvider<SelectedTodo, Todo?>.internal(
  SelectedTodo.new,
  name: r'selectedTodoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedTodoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedTodo = AutoDisposeNotifier<Todo?>;
String _$todoFilterStateHash() => r'6cc0d4a529b753b762e3e79db00edc8be35e860a';

/// See also [TodoFilterState].
@ProviderFor(TodoFilterState)
final todoFilterStateProvider =
    AutoDisposeNotifierProvider<TodoFilterState, TodoFilter>.internal(
  TodoFilterState.new,
  name: r'todoFilterStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoFilterStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoFilterState = AutoDisposeNotifier<TodoFilter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
