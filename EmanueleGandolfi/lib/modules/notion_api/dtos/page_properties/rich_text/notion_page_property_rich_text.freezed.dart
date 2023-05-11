// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_page_property_rich_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPagePropertyRichText _$NotionPagePropertyRichTextFromJson(
    Map<String, dynamic> json) {
  return _NotionPagePropertyRichText.fromJson(json);
}

/// @nodoc
mixin _$NotionPagePropertyRichText {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'rich_text')
  List<NotionRichText> get richText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPagePropertyRichTextCopyWith<NotionPagePropertyRichText>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPagePropertyRichTextCopyWith<$Res> {
  factory $NotionPagePropertyRichTextCopyWith(NotionPagePropertyRichText value,
          $Res Function(NotionPagePropertyRichText) then) =
      _$NotionPagePropertyRichTextCopyWithImpl<$Res,
          NotionPagePropertyRichText>;
  @useResult
  $Res call(
      {String id,
      String type,
      @JsonKey(name: 'rich_text') List<NotionRichText> richText});
}

/// @nodoc
class _$NotionPagePropertyRichTextCopyWithImpl<$Res,
        $Val extends NotionPagePropertyRichText>
    implements $NotionPagePropertyRichTextCopyWith<$Res> {
  _$NotionPagePropertyRichTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? richText = null,
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
      richText: null == richText
          ? _value.richText
          : richText // ignore: cast_nullable_to_non_nullable
              as List<NotionRichText>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionPagePropertyRichTextCopyWith<$Res>
    implements $NotionPagePropertyRichTextCopyWith<$Res> {
  factory _$$_NotionPagePropertyRichTextCopyWith(
          _$_NotionPagePropertyRichText value,
          $Res Function(_$_NotionPagePropertyRichText) then) =
      __$$_NotionPagePropertyRichTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      @JsonKey(name: 'rich_text') List<NotionRichText> richText});
}

/// @nodoc
class __$$_NotionPagePropertyRichTextCopyWithImpl<$Res>
    extends _$NotionPagePropertyRichTextCopyWithImpl<$Res,
        _$_NotionPagePropertyRichText>
    implements _$$_NotionPagePropertyRichTextCopyWith<$Res> {
  __$$_NotionPagePropertyRichTextCopyWithImpl(
      _$_NotionPagePropertyRichText _value,
      $Res Function(_$_NotionPagePropertyRichText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? richText = null,
  }) {
    return _then(_$_NotionPagePropertyRichText(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      richText: null == richText
          ? _value._richText
          : richText // ignore: cast_nullable_to_non_nullable
              as List<NotionRichText>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPagePropertyRichText implements _NotionPagePropertyRichText {
  const _$_NotionPagePropertyRichText(
      {required this.id,
      required this.type,
      @JsonKey(name: 'rich_text') required final List<NotionRichText> richText})
      : _richText = richText;

  factory _$_NotionPagePropertyRichText.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPagePropertyRichTextFromJson(json);

  @override
  final String id;
  @override
  final String type;
  final List<NotionRichText> _richText;
  @override
  @JsonKey(name: 'rich_text')
  List<NotionRichText> get richText {
    if (_richText is EqualUnmodifiableListView) return _richText;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_richText);
  }

  @override
  String toString() {
    return 'NotionPagePropertyRichText(id: $id, type: $type, richText: $richText)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPagePropertyRichTextCopyWith<_$_NotionPagePropertyRichText>
      get copyWith => __$$_NotionPagePropertyRichTextCopyWithImpl<
          _$_NotionPagePropertyRichText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPagePropertyRichTextToJson(
      this,
    );
  }
}

abstract class _NotionPagePropertyRichText
    implements NotionPagePropertyRichText, NotionPageProperty {
  const factory _NotionPagePropertyRichText(
          {required final String id,
          required final String type,
          @JsonKey(name: 'rich_text')
              required final List<NotionRichText> richText}) =
      _$_NotionPagePropertyRichText;

  factory _NotionPagePropertyRichText.fromJson(Map<String, dynamic> json) =
      _$_NotionPagePropertyRichText.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  @JsonKey(name: 'rich_text')
  List<NotionRichText> get richText;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPagePropertyRichTextCopyWith<_$_NotionPagePropertyRichText>
      get copyWith => throw _privateConstructorUsedError;
}
