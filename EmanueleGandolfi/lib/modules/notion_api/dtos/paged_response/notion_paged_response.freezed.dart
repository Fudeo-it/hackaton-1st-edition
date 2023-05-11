// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_paged_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPagedResponse<T> _$NotionPagedResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _NotionPagedResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$NotionPagedResponse<T> {
  String get object => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<T> get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_cursor')
  String? get nextCursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_more')
  bool get hasMore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPagedResponseCopyWith<T, NotionPagedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPagedResponseCopyWith<T, $Res> {
  factory $NotionPagedResponseCopyWith(NotionPagedResponse<T> value,
          $Res Function(NotionPagedResponse<T>) then) =
      _$NotionPagedResponseCopyWithImpl<T, $Res, NotionPagedResponse<T>>;
  @useResult
  $Res call(
      {String object,
      String type,
      List<T> results,
      @JsonKey(name: 'next_cursor') String? nextCursor,
      @JsonKey(name: 'has_more') bool hasMore});
}

/// @nodoc
class _$NotionPagedResponseCopyWithImpl<T, $Res,
        $Val extends NotionPagedResponse<T>>
    implements $NotionPagedResponseCopyWith<T, $Res> {
  _$NotionPagedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? type = null,
    Object? results = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionPagedResponseCopyWith<T, $Res>
    implements $NotionPagedResponseCopyWith<T, $Res> {
  factory _$$_NotionPagedResponseCopyWith(_$_NotionPagedResponse<T> value,
          $Res Function(_$_NotionPagedResponse<T>) then) =
      __$$_NotionPagedResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String object,
      String type,
      List<T> results,
      @JsonKey(name: 'next_cursor') String? nextCursor,
      @JsonKey(name: 'has_more') bool hasMore});
}

/// @nodoc
class __$$_NotionPagedResponseCopyWithImpl<T, $Res>
    extends _$NotionPagedResponseCopyWithImpl<T, $Res,
        _$_NotionPagedResponse<T>>
    implements _$$_NotionPagedResponseCopyWith<T, $Res> {
  __$$_NotionPagedResponseCopyWithImpl(_$_NotionPagedResponse<T> _value,
      $Res Function(_$_NotionPagedResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? type = null,
    Object? results = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
  }) {
    return _then(_$_NotionPagedResponse<T>(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_NotionPagedResponse<T> implements _NotionPagedResponse<T> {
  const _$_NotionPagedResponse(
      {required this.object,
      required this.type,
      required final List<T> results,
      @JsonKey(name: 'next_cursor') required this.nextCursor,
      @JsonKey(name: 'has_more') required this.hasMore})
      : _results = results;

  factory _$_NotionPagedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_NotionPagedResponseFromJson(json, fromJsonT);

  @override
  final String object;
  @override
  final String type;
  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: 'next_cursor')
  final String? nextCursor;
  @override
  @JsonKey(name: 'has_more')
  final bool hasMore;

  @override
  String toString() {
    return 'NotionPagedResponse<$T>(object: $object, type: $type, results: $results, nextCursor: $nextCursor, hasMore: $hasMore)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPagedResponseCopyWith<T, _$_NotionPagedResponse<T>> get copyWith =>
      __$$_NotionPagedResponseCopyWithImpl<T, _$_NotionPagedResponse<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_NotionPagedResponseToJson<T>(this, toJsonT);
  }
}

abstract class _NotionPagedResponse<T> implements NotionPagedResponse<T> {
  const factory _NotionPagedResponse(
          {required final String object,
          required final String type,
          required final List<T> results,
          @JsonKey(name: 'next_cursor') required final String? nextCursor,
          @JsonKey(name: 'has_more') required final bool hasMore}) =
      _$_NotionPagedResponse<T>;

  factory _NotionPagedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_NotionPagedResponse<T>.fromJson;

  @override
  String get object;
  @override
  String get type;
  @override
  List<T> get results;
  @override
  @JsonKey(name: 'next_cursor')
  String? get nextCursor;
  @override
  @JsonKey(name: 'has_more')
  bool get hasMore;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPagedResponseCopyWith<T, _$_NotionPagedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
