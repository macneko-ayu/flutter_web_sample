import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_web_sample/models/todo.dart';

part 'todo_filter.freezed.dart';
part 'todo_filter.g.dart';

enum TodoSortBy {
  dueDate,
  createdAt,
  priority,
  title,
}

@freezed
class TodoFilter with _$TodoFilter {
  const factory TodoFilter({
    String? searchQuery,
    bool? isCompleted,
    Priority? priority,
    List<String>? tags,
    @Default(TodoSortBy.createdAt) TodoSortBy sortBy,
    @Default(false) bool sortDescending,
  }) = _TodoFilter;

  factory TodoFilter.fromJson(Map<String, dynamic> json) =>
      _$TodoFilterFromJson(json);
} 