// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_property_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPropertyText _$NotionPropertyTextFromJson(Map<String, dynamic> json) {
  return _NotionPropertyText.fromJson(json);
}

/// @nodoc
mixin _$NotionPropertyText {
  String get type => throw _privateConstructorUsedError;
  NotionPropertyTextContent? get text => throw _privateConstructorUsedError;
  NotionPropertyTextAnnotation? get annotations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "plain_text")
  String? get plainText => throw _privateConstructorUsedError;
  String? get href => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPropertyTextCopyWith<NotionPropertyText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPropertyTextCopyWith<$Res> {
  factory $NotionPropertyTextCopyWith(
          NotionPropertyText value, $Res Function(NotionPropertyText) then) =
      _$NotionPropertyTextCopyWithImpl<$Res, NotionPropertyText>;
  @useResult
  $Res call(
      {String type,
      NotionPropertyTextContent? text,
      NotionPropertyTextAnnotation? annotations,
      @JsonKey(name: "plain_text") String? plainText,
      String? href});

  $NotionPropertyTextContentCopyWith<$Res>? get text;
  $NotionPropertyTextAnnotationCopyWith<$Res>? get annotations;
}

/// @nodoc
class _$NotionPropertyTextCopyWithImpl<$Res, $Val extends NotionPropertyText>
    implements $NotionPropertyTextCopyWith<$Res> {
  _$NotionPropertyTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = freezed,
    Object? annotations = freezed,
    Object? plainText = freezed,
    Object? href = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as NotionPropertyTextContent?,
      annotations: freezed == annotations
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as NotionPropertyTextAnnotation?,
      plainText: freezed == plainText
          ? _value.plainText
          : plainText // ignore: cast_nullable_to_non_nullable
              as String?,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionPropertyTextContentCopyWith<$Res>? get text {
    if (_value.text == null) {
      return null;
    }

    return $NotionPropertyTextContentCopyWith<$Res>(_value.text!, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionPropertyTextAnnotationCopyWith<$Res>? get annotations {
    if (_value.annotations == null) {
      return null;
    }

    return $NotionPropertyTextAnnotationCopyWith<$Res>(_value.annotations!,
        (value) {
      return _then(_value.copyWith(annotations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionPropertyTextCopyWith<$Res>
    implements $NotionPropertyTextCopyWith<$Res> {
  factory _$$_NotionPropertyTextCopyWith(_$_NotionPropertyText value,
          $Res Function(_$_NotionPropertyText) then) =
      __$$_NotionPropertyTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      NotionPropertyTextContent? text,
      NotionPropertyTextAnnotation? annotations,
      @JsonKey(name: "plain_text") String? plainText,
      String? href});

  @override
  $NotionPropertyTextContentCopyWith<$Res>? get text;
  @override
  $NotionPropertyTextAnnotationCopyWith<$Res>? get annotations;
}

/// @nodoc
class __$$_NotionPropertyTextCopyWithImpl<$Res>
    extends _$NotionPropertyTextCopyWithImpl<$Res, _$_NotionPropertyText>
    implements _$$_NotionPropertyTextCopyWith<$Res> {
  __$$_NotionPropertyTextCopyWithImpl(
      _$_NotionPropertyText _value, $Res Function(_$_NotionPropertyText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = freezed,
    Object? annotations = freezed,
    Object? plainText = freezed,
    Object? href = freezed,
  }) {
    return _then(_$_NotionPropertyText(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as NotionPropertyTextContent?,
      annotations: freezed == annotations
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as NotionPropertyTextAnnotation?,
      plainText: freezed == plainText
          ? _value.plainText
          : plainText // ignore: cast_nullable_to_non_nullable
              as String?,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPropertyText implements _NotionPropertyText {
  const _$_NotionPropertyText(
      {required this.type,
      this.text,
      this.annotations,
      @JsonKey(name: "plain_text") this.plainText,
      this.href});

  factory _$_NotionPropertyText.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPropertyTextFromJson(json);

  @override
  final String type;
  @override
  final NotionPropertyTextContent? text;
  @override
  final NotionPropertyTextAnnotation? annotations;
  @override
  @JsonKey(name: "plain_text")
  final String? plainText;
  @override
  final String? href;

  @override
  String toString() {
    return 'NotionPropertyText(type: $type, text: $text, annotations: $annotations, plainText: $plainText, href: $href)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotionPropertyText &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.annotations, annotations) ||
                other.annotations == annotations) &&
            (identical(other.plainText, plainText) ||
                other.plainText == plainText) &&
            (identical(other.href, href) || other.href == href));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, text, annotations, plainText, href);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPropertyTextCopyWith<_$_NotionPropertyText> get copyWith =>
      __$$_NotionPropertyTextCopyWithImpl<_$_NotionPropertyText>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPropertyTextToJson(
      this,
    );
  }
}

abstract class _NotionPropertyText implements NotionPropertyText {
  const factory _NotionPropertyText(
      {required final String type,
      final NotionPropertyTextContent? text,
      final NotionPropertyTextAnnotation? annotations,
      @JsonKey(name: "plain_text") final String? plainText,
      final String? href}) = _$_NotionPropertyText;

  factory _NotionPropertyText.fromJson(Map<String, dynamic> json) =
      _$_NotionPropertyText.fromJson;

  @override
  String get type;
  @override
  NotionPropertyTextContent? get text;
  @override
  NotionPropertyTextAnnotation? get annotations;
  @override
  @JsonKey(name: "plain_text")
  String? get plainText;
  @override
  String? get href;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPropertyTextCopyWith<_$_NotionPropertyText> get copyWith =>
      throw _privateConstructorUsedError;
}
