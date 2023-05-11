// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionApiError _$NotionApiErrorFromJson(Map<String, dynamic> json) {
  return _NotionApiError.fromJson(json);
}

/// @nodoc
mixin _$NotionApiError {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionApiErrorCopyWith<NotionApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionApiErrorCopyWith<$Res> {
  factory $NotionApiErrorCopyWith(
          NotionApiError value, $Res Function(NotionApiError) then) =
      _$NotionApiErrorCopyWithImpl<$Res, NotionApiError>;
  @useResult
  $Res call({String code, String message});
}

/// @nodoc
class _$NotionApiErrorCopyWithImpl<$Res, $Val extends NotionApiError>
    implements $NotionApiErrorCopyWith<$Res> {
  _$NotionApiErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionApiErrorCopyWith<$Res>
    implements $NotionApiErrorCopyWith<$Res> {
  factory _$$_NotionApiErrorCopyWith(
          _$_NotionApiError value, $Res Function(_$_NotionApiError) then) =
      __$$_NotionApiErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message});
}

/// @nodoc
class __$$_NotionApiErrorCopyWithImpl<$Res>
    extends _$NotionApiErrorCopyWithImpl<$Res, _$_NotionApiError>
    implements _$$_NotionApiErrorCopyWith<$Res> {
  __$$_NotionApiErrorCopyWithImpl(
      _$_NotionApiError _value, $Res Function(_$_NotionApiError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_$_NotionApiError(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionApiError implements _NotionApiError {
  const _$_NotionApiError({required this.code, required this.message});

  factory _$_NotionApiError.fromJson(Map<String, dynamic> json) =>
      _$$_NotionApiErrorFromJson(json);

  @override
  final String code;
  @override
  final String message;

  @override
  String toString() {
    return 'NotionApiError(code: $code, message: $message)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionApiErrorCopyWith<_$_NotionApiError> get copyWith =>
      __$$_NotionApiErrorCopyWithImpl<_$_NotionApiError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionApiErrorToJson(
      this,
    );
  }
}

abstract class _NotionApiError implements NotionApiError {
  const factory _NotionApiError(
      {required final String code,
      required final String message}) = _$_NotionApiError;

  factory _NotionApiError.fromJson(Map<String, dynamic> json) =
      _$_NotionApiError.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NotionApiErrorCopyWith<_$_NotionApiError> get copyWith =>
      throw _privateConstructorUsedError;
}
