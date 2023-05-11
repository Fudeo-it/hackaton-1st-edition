// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_database_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionDatabaseResponse<T> _$NotionDatabaseResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _NotionDatabaseResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$NotionDatabaseResponse<T> {
  String? get object => throw _privateConstructorUsedError;
  List<T>? get results => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;
  bool? get hasMore => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get developerSurvey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionDatabaseResponseCopyWith<T, NotionDatabaseResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionDatabaseResponseCopyWith<T, $Res> {
  factory $NotionDatabaseResponseCopyWith(NotionDatabaseResponse<T> value,
          $Res Function(NotionDatabaseResponse<T>) then) =
      _$NotionDatabaseResponseCopyWithImpl<T, $Res, NotionDatabaseResponse<T>>;
  @useResult
  $Res call(
      {String? object,
      List<T>? results,
      String? nextCursor,
      bool? hasMore,
      String? type,
      String? developerSurvey});
}

/// @nodoc
class _$NotionDatabaseResponseCopyWithImpl<T, $Res,
        $Val extends NotionDatabaseResponse<T>>
    implements $NotionDatabaseResponseCopyWith<T, $Res> {
  _$NotionDatabaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = freezed,
    Object? results = freezed,
    Object? nextCursor = freezed,
    Object? hasMore = freezed,
    Object? type = freezed,
    Object? developerSurvey = freezed,
  }) {
    return _then(_value.copyWith(
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMore: freezed == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      developerSurvey: freezed == developerSurvey
          ? _value.developerSurvey
          : developerSurvey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionDatabaseResponseCopyWith<T, $Res>
    implements $NotionDatabaseResponseCopyWith<T, $Res> {
  factory _$$_NotionDatabaseResponseCopyWith(_$_NotionDatabaseResponse<T> value,
          $Res Function(_$_NotionDatabaseResponse<T>) then) =
      __$$_NotionDatabaseResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String? object,
      List<T>? results,
      String? nextCursor,
      bool? hasMore,
      String? type,
      String? developerSurvey});
}

/// @nodoc
class __$$_NotionDatabaseResponseCopyWithImpl<T, $Res>
    extends _$NotionDatabaseResponseCopyWithImpl<T, $Res,
        _$_NotionDatabaseResponse<T>>
    implements _$$_NotionDatabaseResponseCopyWith<T, $Res> {
  __$$_NotionDatabaseResponseCopyWithImpl(_$_NotionDatabaseResponse<T> _value,
      $Res Function(_$_NotionDatabaseResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = freezed,
    Object? results = freezed,
    Object? nextCursor = freezed,
    Object? hasMore = freezed,
    Object? type = freezed,
    Object? developerSurvey = freezed,
  }) {
    return _then(_$_NotionDatabaseResponse<T>(
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMore: freezed == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      developerSurvey: freezed == developerSurvey
          ? _value.developerSurvey
          : developerSurvey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_NotionDatabaseResponse<T> extends _NotionDatabaseResponse<T> {
  const _$_NotionDatabaseResponse(
      {this.object,
      final List<T>? results,
      this.nextCursor,
      this.hasMore,
      this.type,
      this.developerSurvey})
      : _results = results,
        super._();

  factory _$_NotionDatabaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_NotionDatabaseResponseFromJson(json, fromJsonT);

  @override
  final String? object;
  final List<T>? _results;
  @override
  List<T>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? nextCursor;
  @override
  final bool? hasMore;
  @override
  final String? type;
  @override
  final String? developerSurvey;

  @override
  String toString() {
    return 'NotionDatabaseResponse<$T>(object: $object, results: $results, nextCursor: $nextCursor, hasMore: $hasMore, type: $type, developerSurvey: $developerSurvey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotionDatabaseResponse<T> &&
            (identical(other.object, object) || other.object == object) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.developerSurvey, developerSurvey) ||
                other.developerSurvey == developerSurvey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      object,
      const DeepCollectionEquality().hash(_results),
      nextCursor,
      hasMore,
      type,
      developerSurvey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionDatabaseResponseCopyWith<T, _$_NotionDatabaseResponse<T>>
      get copyWith => __$$_NotionDatabaseResponseCopyWithImpl<T,
          _$_NotionDatabaseResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_NotionDatabaseResponseToJson<T>(this, toJsonT);
  }
}

abstract class _NotionDatabaseResponse<T> extends NotionDatabaseResponse<T> {
  const factory _NotionDatabaseResponse(
      {final String? object,
      final List<T>? results,
      final String? nextCursor,
      final bool? hasMore,
      final String? type,
      final String? developerSurvey}) = _$_NotionDatabaseResponse<T>;
  const _NotionDatabaseResponse._() : super._();

  factory _NotionDatabaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_NotionDatabaseResponse<T>.fromJson;

  @override
  String? get object;
  @override
  List<T>? get results;
  @override
  String? get nextCursor;
  @override
  bool? get hasMore;
  @override
  String? get type;
  @override
  String? get developerSurvey;
  @override
  @JsonKey(ignore: true)
  _$$_NotionDatabaseResponseCopyWith<T, _$_NotionDatabaseResponse<T>>
      get copyWith => throw _privateConstructorUsedError;
}
