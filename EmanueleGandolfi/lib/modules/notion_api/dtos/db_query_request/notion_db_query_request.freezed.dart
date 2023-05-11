// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_db_query_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionDbQueryRequest _$NotionDbQueryRequestFromJson(Map<String, dynamic> json) {
  return _NotionDbQueryRequest.fromJson(json);
}

/// @nodoc
mixin _$NotionDbQueryRequest {
  @JsonKey(name: 'page_size')
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_cursor', includeIfNull: false)
  String? get startCursor => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  @NotionFilterConverter()
  NotionFilter? get filter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionDbQueryRequestCopyWith<NotionDbQueryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionDbQueryRequestCopyWith<$Res> {
  factory $NotionDbQueryRequestCopyWith(NotionDbQueryRequest value,
          $Res Function(NotionDbQueryRequest) then) =
      _$NotionDbQueryRequestCopyWithImpl<$Res, NotionDbQueryRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'page_size')
          int pageSize,
      @JsonKey(name: 'start_cursor', includeIfNull: false)
          String? startCursor,
      @JsonKey(includeIfNull: false)
      @NotionFilterConverter()
          NotionFilter? filter});

  $NotionFilterCopyWith<$Res>? get filter;
}

/// @nodoc
class _$NotionDbQueryRequestCopyWithImpl<$Res,
        $Val extends NotionDbQueryRequest>
    implements $NotionDbQueryRequestCopyWith<$Res> {
  _$NotionDbQueryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? startCursor = freezed,
    Object? filter = freezed,
  }) {
    return _then(_value.copyWith(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      startCursor: freezed == startCursor
          ? _value.startCursor
          : startCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as NotionFilter?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionFilterCopyWith<$Res>? get filter {
    if (_value.filter == null) {
      return null;
    }

    return $NotionFilterCopyWith<$Res>(_value.filter!, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionDbQueryRequestCopyWith<$Res>
    implements $NotionDbQueryRequestCopyWith<$Res> {
  factory _$$_NotionDbQueryRequestCopyWith(_$_NotionDbQueryRequest value,
          $Res Function(_$_NotionDbQueryRequest) then) =
      __$$_NotionDbQueryRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page_size')
          int pageSize,
      @JsonKey(name: 'start_cursor', includeIfNull: false)
          String? startCursor,
      @JsonKey(includeIfNull: false)
      @NotionFilterConverter()
          NotionFilter? filter});

  @override
  $NotionFilterCopyWith<$Res>? get filter;
}

/// @nodoc
class __$$_NotionDbQueryRequestCopyWithImpl<$Res>
    extends _$NotionDbQueryRequestCopyWithImpl<$Res, _$_NotionDbQueryRequest>
    implements _$$_NotionDbQueryRequestCopyWith<$Res> {
  __$$_NotionDbQueryRequestCopyWithImpl(_$_NotionDbQueryRequest _value,
      $Res Function(_$_NotionDbQueryRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? startCursor = freezed,
    Object? filter = freezed,
  }) {
    return _then(_$_NotionDbQueryRequest(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      startCursor: freezed == startCursor
          ? _value.startCursor
          : startCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as NotionFilter?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionDbQueryRequest implements _NotionDbQueryRequest {
  const _$_NotionDbQueryRequest(
      {@JsonKey(name: 'page_size') required this.pageSize,
      @JsonKey(name: 'start_cursor', includeIfNull: false) this.startCursor,
      @JsonKey(includeIfNull: false) @NotionFilterConverter() this.filter});

  factory _$_NotionDbQueryRequest.fromJson(Map<String, dynamic> json) =>
      _$$_NotionDbQueryRequestFromJson(json);

  @override
  @JsonKey(name: 'page_size')
  final int pageSize;
  @override
  @JsonKey(name: 'start_cursor', includeIfNull: false)
  final String? startCursor;
  @override
  @JsonKey(includeIfNull: false)
  @NotionFilterConverter()
  final NotionFilter? filter;

  @override
  String toString() {
    return 'NotionDbQueryRequest(pageSize: $pageSize, startCursor: $startCursor, filter: $filter)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionDbQueryRequestCopyWith<_$_NotionDbQueryRequest> get copyWith =>
      __$$_NotionDbQueryRequestCopyWithImpl<_$_NotionDbQueryRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionDbQueryRequestToJson(
      this,
    );
  }
}

abstract class _NotionDbQueryRequest implements NotionDbQueryRequest {
  const factory _NotionDbQueryRequest(
      {@JsonKey(name: 'page_size')
          required final int pageSize,
      @JsonKey(name: 'start_cursor', includeIfNull: false)
          final String? startCursor,
      @JsonKey(includeIfNull: false)
      @NotionFilterConverter()
          final NotionFilter? filter}) = _$_NotionDbQueryRequest;

  factory _NotionDbQueryRequest.fromJson(Map<String, dynamic> json) =
      _$_NotionDbQueryRequest.fromJson;

  @override
  @JsonKey(name: 'page_size')
  int get pageSize;
  @override
  @JsonKey(name: 'start_cursor', includeIfNull: false)
  String? get startCursor;
  @override
  @JsonKey(includeIfNull: false)
  @NotionFilterConverter()
  NotionFilter? get filter;
  @override
  @JsonKey(ignore: true)
  _$$_NotionDbQueryRequestCopyWith<_$_NotionDbQueryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
