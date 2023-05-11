// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionUrl _$NotionUrlFromJson(Map<String, dynamic> json) {
  return _NotionUrl.fromJson(json);
}

/// @nodoc
mixin _$NotionUrl {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionUrlCopyWith<NotionUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionUrlCopyWith<$Res> {
  factory $NotionUrlCopyWith(NotionUrl value, $Res Function(NotionUrl) then) =
      _$NotionUrlCopyWithImpl<$Res, NotionUrl>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$NotionUrlCopyWithImpl<$Res, $Val extends NotionUrl>
    implements $NotionUrlCopyWith<$Res> {
  _$NotionUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionUrlCopyWith<$Res> implements $NotionUrlCopyWith<$Res> {
  factory _$$_NotionUrlCopyWith(
          _$_NotionUrl value, $Res Function(_$_NotionUrl) then) =
      __$$_NotionUrlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$_NotionUrlCopyWithImpl<$Res>
    extends _$NotionUrlCopyWithImpl<$Res, _$_NotionUrl>
    implements _$$_NotionUrlCopyWith<$Res> {
  __$$_NotionUrlCopyWithImpl(
      _$_NotionUrl _value, $Res Function(_$_NotionUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_NotionUrl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionUrl implements _NotionUrl {
  const _$_NotionUrl({required this.url});

  factory _$_NotionUrl.fromJson(Map<String, dynamic> json) =>
      _$$_NotionUrlFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'NotionUrl(url: $url)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionUrlCopyWith<_$_NotionUrl> get copyWith =>
      __$$_NotionUrlCopyWithImpl<_$_NotionUrl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionUrlToJson(
      this,
    );
  }
}

abstract class _NotionUrl implements NotionUrl {
  const factory _NotionUrl({required final String url}) = _$_NotionUrl;

  factory _NotionUrl.fromJson(Map<String, dynamic> json) =
      _$_NotionUrl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_NotionUrlCopyWith<_$_NotionUrl> get copyWith =>
      throw _privateConstructorUsedError;
}
