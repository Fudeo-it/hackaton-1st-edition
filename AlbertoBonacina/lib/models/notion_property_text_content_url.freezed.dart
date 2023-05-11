// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_property_text_content_url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPropertyTextContentUrl _$NotionPropertyTextContentUrlFromJson(
    Map<String, dynamic> json) {
  return _NotionPropertyTextContentUrl.fromJson(json);
}

/// @nodoc
mixin _$NotionPropertyTextContentUrl {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPropertyTextContentUrlCopyWith<NotionPropertyTextContentUrl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPropertyTextContentUrlCopyWith<$Res> {
  factory $NotionPropertyTextContentUrlCopyWith(
          NotionPropertyTextContentUrl value,
          $Res Function(NotionPropertyTextContentUrl) then) =
      _$NotionPropertyTextContentUrlCopyWithImpl<$Res,
          NotionPropertyTextContentUrl>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$NotionPropertyTextContentUrlCopyWithImpl<$Res,
        $Val extends NotionPropertyTextContentUrl>
    implements $NotionPropertyTextContentUrlCopyWith<$Res> {
  _$NotionPropertyTextContentUrlCopyWithImpl(this._value, this._then);

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
abstract class _$$_NotionPropertyTextContentUrlCopyWith<$Res>
    implements $NotionPropertyTextContentUrlCopyWith<$Res> {
  factory _$$_NotionPropertyTextContentUrlCopyWith(
          _$_NotionPropertyTextContentUrl value,
          $Res Function(_$_NotionPropertyTextContentUrl) then) =
      __$$_NotionPropertyTextContentUrlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$_NotionPropertyTextContentUrlCopyWithImpl<$Res>
    extends _$NotionPropertyTextContentUrlCopyWithImpl<$Res,
        _$_NotionPropertyTextContentUrl>
    implements _$$_NotionPropertyTextContentUrlCopyWith<$Res> {
  __$$_NotionPropertyTextContentUrlCopyWithImpl(
      _$_NotionPropertyTextContentUrl _value,
      $Res Function(_$_NotionPropertyTextContentUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_NotionPropertyTextContentUrl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPropertyTextContentUrl implements _NotionPropertyTextContentUrl {
  const _$_NotionPropertyTextContentUrl({required this.url});

  factory _$_NotionPropertyTextContentUrl.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPropertyTextContentUrlFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'NotionPropertyTextContentUrl(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotionPropertyTextContentUrl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPropertyTextContentUrlCopyWith<_$_NotionPropertyTextContentUrl>
      get copyWith => __$$_NotionPropertyTextContentUrlCopyWithImpl<
          _$_NotionPropertyTextContentUrl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPropertyTextContentUrlToJson(
      this,
    );
  }
}

abstract class _NotionPropertyTextContentUrl
    implements NotionPropertyTextContentUrl {
  const factory _NotionPropertyTextContentUrl({required final String url}) =
      _$_NotionPropertyTextContentUrl;

  factory _NotionPropertyTextContentUrl.fromJson(Map<String, dynamic> json) =
      _$_NotionPropertyTextContentUrl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPropertyTextContentUrlCopyWith<_$_NotionPropertyTextContentUrl>
      get copyWith => throw _privateConstructorUsedError;
}
