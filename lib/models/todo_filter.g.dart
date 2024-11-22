// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoFilterImpl _$$TodoFilterImplFromJson(Map<String, dynamic> json) =>
    _$TodoFilterImpl(
      searchQuery: json['searchQuery'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      priority: $enumDecodeNullable(_$PriorityEnumMap, json['priority']),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      sortBy: $enumDecodeNullable(_$TodoSortByEnumMap, json['sortBy']) ??
          TodoSortBy.createdAt,
      sortDescending: json['sortDescending'] as bool? ?? false,
    );

Map<String, dynamic> _$$TodoFilterImplToJson(_$TodoFilterImpl instance) =>
    <String, dynamic>{
      'searchQuery': instance.searchQuery,
      'isCompleted': instance.isCompleted,
      'priority': _$PriorityEnumMap[instance.priority],
      'tags': instance.tags,
      'sortBy': _$TodoSortByEnumMap[instance.sortBy]!,
      'sortDescending': instance.sortDescending,
    };

const _$PriorityEnumMap = {
  Priority.high: 'high',
  Priority.medium: 'medium',
  Priority.low: 'low',
};

const _$TodoSortByEnumMap = {
  TodoSortBy.dueDate: 'dueDate',
  TodoSortBy.createdAt: 'createdAt',
  TodoSortBy.priority: 'priority',
  TodoSortBy.title: 'title',
};
