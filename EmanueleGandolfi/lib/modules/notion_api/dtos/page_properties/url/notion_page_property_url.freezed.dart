// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_page_property_url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPagePropertyUrl _$NotionPagePropertyUrlFromJson(
    Map<String, dynamic> json) {
  return _NotionPagePropertyUrl.fromJson(json);
}

/// @nodoc
mixin _$NotionPagePropertyUrl {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPagePropertyUrlCopyWith<NotionPagePropertyUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPagePropertyUrlCopyWith<$Res> {
  factory $NotionPagePropertyUrlCopyWith(NotionPagePropertyUrl value,
          $Res Function(NotionPagePropertyUrl) then) =
      _$NotionPagePropertyUrlCopyWithImpl<$Res, NotionPagePropertyUrl>;
  @useResult
  $Res call({String id, String type, String? url});
}

/// @nodoc
class _$NotionPagePropertyUrlCopyWithImpl<$Res,
        $Val extends NotionPagePropertyUrl>
    implements $NotionPagePropertyUrlCopyWith<$Res> {
  _$NotionPagePropertyUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionPagePropertyUrlCopyWith<$Res>
    implements $NotionPagePropertyUrlCopyWith<$Res> {
  factory _$$_NotionPagePropertyUrlCopyWith(_$_NotionPagePropertyUrl value,
          $Res Function(_$_NotionPagePropertyUrl) then) =
      __$$_NotionPagePropertyUrlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, String? url});
}

/// @nodoc
class __$$_NotionPagePropertyUrlCopyWithImpl<$Res>
    extends _$NotionPagePropertyUrlCopyWithImpl<$Res, _$_NotionPagePropertyUrl>
    implements _$$_NotionPagePropertyUrlCopyWith<$Res> {
  __$$_NotionPagePropertyUrlCopyWithImpl(_$_NotionPagePropertyUrl _value,
      $Res Function(_$_NotionPagePropertyUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? url = freezed,
  }) {
    return _then(_$_NotionPagePropertyUrl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPagePropertyUrl implements _NotionPagePropertyUrl {
  const _$_NotionPagePropertyUrl(
      {required this.id, required this.type, required this.url});

  factory _$_NotionPagePropertyUrl.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPagePropertyUrlFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String? url;

  @override
  String toString() {
    return 'NotionPagePropertyUrl(id: $id, type: $type, url: $url)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPagePropertyUrlCopyWith<_$_NotionPagePropertyUrl> get copyWith =>
      __$$_NotionPagePropertyUrlCopyWithImpl<_$_NotionPagePropertyUrl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPagePropertyUrlToJson(
      this,
    );
  }
}

abstract class _NotionPagePropertyUrl
    implements NotionPagePropertyUrl, NotionPageProperty {
  const factory _NotionPagePropertyUrl(
      {required final String id,
      required final String type,
      required final String? url}) = _$_NotionPagePropertyUrl;

  factory _NotionPagePropertyUrl.fromJson(Map<String, dynamic> json) =
      _$_NotionPagePropertyUrl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPagePropertyUrlCopyWith<_$_NotionPagePropertyUrl> get copyWith =>
      throw _privateConstructorUsedError;
}
