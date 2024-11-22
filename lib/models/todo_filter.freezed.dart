// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoFilter _$TodoFilterFromJson(Map<String, dynamic> json) {
  return _TodoFilter.fromJson(json);
}

/// @nodoc
mixin _$TodoFilter {
  String? get searchQuery => throw _privateConstructorUsedError;
  bool? get isCompleted => throw _privateConstructorUsedError;
  Priority? get priority => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  TodoSortBy get sortBy => throw _privateConstructorUsedError;
  bool get sortDescending => throw _privateConstructorUsedError;

  /// Serializes this TodoFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoFilterCopyWith<TodoFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoFilterCopyWith<$Res> {
  factory $TodoFilterCopyWith(
          TodoFilter value, $Res Function(TodoFilter) then) =
      _$TodoFilterCopyWithImpl<$Res, TodoFilter>;
  @useResult
  $Res call(
      {String? searchQuery,
      bool? isCompleted,
      Priority? priority,
      List<String>? tags,
      TodoSortBy sortBy,
      bool sortDescending});
}

/// @nodoc
class _$TodoFilterCopyWithImpl<$Res, $Val extends TodoFilter>
    implements $TodoFilterCopyWith<$Res> {
  _$TodoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? isCompleted = freezed,
    Object? priority = freezed,
    Object? tags = freezed,
    Object? sortBy = null,
    Object? sortDescending = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as TodoSortBy,
      sortDescending: null == sortDescending
          ? _value.sortDescending
          : sortDescending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoFilterImplCopyWith<$Res>
    implements $TodoFilterCopyWith<$Res> {
  factory _$$TodoFilterImplCopyWith(
          _$TodoFilterImpl value, $Res Function(_$TodoFilterImpl) then) =
      __$$TodoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? searchQuery,
      bool? isCompleted,
      Priority? priority,
      List<String>? tags,
      TodoSortBy sortBy,
      bool sortDescending});
}

/// @nodoc
class __$$TodoFilterImplCopyWithImpl<$Res>
    extends _$TodoFilterCopyWithImpl<$Res, _$TodoFilterImpl>
    implements _$$TodoFilterImplCopyWith<$Res> {
  __$$TodoFilterImplCopyWithImpl(
      _$TodoFilterImpl _value, $Res Function(_$TodoFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? isCompleted = freezed,
    Object? priority = freezed,
    Object? tags = freezed,
    Object? sortBy = null,
    Object? sortDescending = null,
  }) {
    return _then(_$TodoFilterImpl(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as TodoSortBy,
      sortDescending: null == sortDescending
          ? _value.sortDescending
          : sortDescending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoFilterImpl implements _TodoFilter {
  const _$TodoFilterImpl(
      {this.searchQuery,
      this.isCompleted,
      this.priority,
      final List<String>? tags,
      this.sortBy = TodoSortBy.createdAt,
      this.sortDescending = false})
      : _tags = tags;

  factory _$TodoFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoFilterImplFromJson(json);

  @override
  final String? searchQuery;
  @override
  final bool? isCompleted;
  @override
  final Priority? priority;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final TodoSortBy sortBy;
  @override
  @JsonKey()
  final bool sortDescending;

  @override
  String toString() {
    return 'TodoFilter(searchQuery: $searchQuery, isCompleted: $isCompleted, priority: $priority, tags: $tags, sortBy: $sortBy, sortDescending: $sortDescending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoFilterImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortDescending, sortDescending) ||
                other.sortDescending == sortDescending));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchQuery,
      isCompleted,
      priority,
      const DeepCollectionEquality().hash(_tags),
      sortBy,
      sortDescending);

  /// Create a copy of TodoFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoFilterImplCopyWith<_$TodoFilterImpl> get copyWith =>
      __$$TodoFilterImplCopyWithImpl<_$TodoFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoFilterImplToJson(
      this,
    );
  }
}

abstract class _TodoFilter implements TodoFilter {
  const factory _TodoFilter(
      {final String? searchQuery,
      final bool? isCompleted,
      final Priority? priority,
      final List<String>? tags,
      final TodoSortBy sortBy,
      final bool sortDescending}) = _$TodoFilterImpl;

  factory _TodoFilter.fromJson(Map<String, dynamic> json) =
      _$TodoFilterImpl.fromJson;

  @override
  String? get searchQuery;
  @override
  bool? get isCompleted;
  @override
  Priority? get priority;
  @override
  List<String>? get tags;
  @override
  TodoSortBy get sortBy;
  @override
  bool get sortDescending;

  /// Create a copy of TodoFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoFilterImplCopyWith<_$TodoFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
