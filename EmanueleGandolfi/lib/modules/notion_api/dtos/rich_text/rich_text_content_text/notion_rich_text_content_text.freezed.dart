// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_rich_text_content_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionRichTextContentText _$NotionRichTextContentTextFromJson(
    Map<String, dynamic> json) {
  return _NotionRichTextContentText.fromJson(json);
}

/// @nodoc
mixin _$NotionRichTextContentText {
  String get content => throw _privateConstructorUsedError;
  NotionUrl? get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionRichTextContentTextCopyWith<NotionRichTextContentText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionRichTextContentTextCopyWith<$Res> {
  factory $NotionRichTextContentTextCopyWith(NotionRichTextContentText value,
          $Res Function(NotionRichTextContentText) then) =
      _$NotionRichTextContentTextCopyWithImpl<$Res, NotionRichTextContentText>;
  @useResult
  $Res call({String content, NotionUrl? link});

  $NotionUrlCopyWith<$Res>? get link;
}

/// @nodoc
class _$NotionRichTextContentTextCopyWithImpl<$Res,
        $Val extends NotionRichTextContentText>
    implements $NotionRichTextContentTextCopyWith<$Res> {
  _$NotionRichTextContentTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as NotionUrl?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionUrlCopyWith<$Res>? get link {
    if (_value.link == null) {
      return null;
    }

    return $NotionUrlCopyWith<$Res>(_value.link!, (value) {
      return _then(_value.copyWith(link: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionRichTextContentTextCopyWith<$Res>
    implements $NotionRichTextContentTextCopyWith<$Res> {
  factory _$$_NotionRichTextContentTextCopyWith(
          _$_NotionRichTextContentText value,
          $Res Function(_$_NotionRichTextContentText) then) =
      __$$_NotionRichTextContentTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, NotionUrl? link});

  @override
  $NotionUrlCopyWith<$Res>? get link;
}

/// @nodoc
class __$$_NotionRichTextContentTextCopyWithImpl<$Res>
    extends _$NotionRichTextContentTextCopyWithImpl<$Res,
        _$_NotionRichTextContentText>
    implements _$$_NotionRichTextContentTextCopyWith<$Res> {
  __$$_NotionRichTextContentTextCopyWithImpl(
      _$_NotionRichTextContentText _value,
      $Res Function(_$_NotionRichTextContentText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? link = freezed,
  }) {
    return _then(_$_NotionRichTextContentText(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as NotionUrl?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionRichTextContentText implements _NotionRichTextContentText {
  const _$_NotionRichTextContentText(
      {required this.content, required this.link});

  factory _$_NotionRichTextContentText.fromJson(Map<String, dynamic> json) =>
      _$$_NotionRichTextContentTextFromJson(json);

  @override
  final String content;
  @override
  final NotionUrl? link;

  @override
  String toString() {
    return 'NotionRichTextContentText(content: $content, link: $link)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionRichTextContentTextCopyWith<_$_NotionRichTextContentText>
      get copyWith => __$$_NotionRichTextContentTextCopyWithImpl<
          _$_NotionRichTextContentText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionRichTextContentTextToJson(
      this,
    );
  }
}

abstract class _NotionRichTextContentText implements NotionRichTextContentText {
  const factory _NotionRichTextContentText(
      {required final String content,
      required final NotionUrl? link}) = _$_NotionRichTextContentText;

  factory _NotionRichTextContentText.fromJson(Map<String, dynamic> json) =
      _$_NotionRichTextContentText.fromJson;

  @override
  String get content;
  @override
  NotionUrl? get link;
  @override
  @JsonKey(ignore: true)
  _$$_NotionRichTextContentTextCopyWith<_$_NotionRichTextContentText>
      get copyWith => throw _privateConstructorUsedError;
}
