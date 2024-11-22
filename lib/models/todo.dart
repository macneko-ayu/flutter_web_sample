import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

enum Priority {
  high,
  medium,
  low,
}

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    String? description,
    DateTime? dueDate,
    @Default(Priority.medium) Priority priority,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default([]) List<String> tags,
  }) = _Todo;

  factory Todo.create({
    required String title,
    String? description,
    DateTime? dueDate,
    Priority? priority,
    List<String>? tags,
  }) {
    final now = DateTime.now();
    return Todo(
      id: const Uuid().v4(),
      title: title,
      description: description,
      dueDate: dueDate,
      priority: priority ?? Priority.medium,
      createdAt: now,
      updatedAt: now,
      tags: tags ?? [],
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
} 