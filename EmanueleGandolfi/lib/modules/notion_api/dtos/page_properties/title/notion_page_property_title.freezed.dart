// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_page_property_title.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPagePropertyTitle _$NotionPagePropertyTitleFromJson(
    Map<String, dynamic> json) {
  return _NotionPagePropertyTitle.fromJson(json);
}

/// @nodoc
mixin _$NotionPagePropertyTitle {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<NotionRichText> get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPagePropertyTitleCopyWith<NotionPagePropertyTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPagePropertyTitleCopyWith<$Res> {
  factory $NotionPagePropertyTitleCopyWith(NotionPagePropertyTitle value,
          $Res Function(NotionPagePropertyTitle) then) =
      _$NotionPagePropertyTitleCopyWithImpl<$Res, NotionPagePropertyTitle>;
  @useResult
  $Res call({String id, String type, List<NotionRichText> title});
}

/// @nodoc
class _$NotionPagePropertyTitleCopyWithImpl<$Res,
        $Val extends NotionPagePropertyTitle>
    implements $NotionPagePropertyTitleCopyWith<$Res> {
  _$NotionPagePropertyTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as List<NotionRichText>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionPagePropertyTitleCopyWith<$Res>
    implements $NotionPagePropertyTitleCopyWith<$Res> {
  factory _$$_NotionPagePropertyTitleCopyWith(_$_NotionPagePropertyTitle value,
          $Res Function(_$_NotionPagePropertyTitle) then) =
      __$$_NotionPagePropertyTitleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, List<NotionRichText> title});
}

/// @nodoc
class __$$_NotionPagePropertyTitleCopyWithImpl<$Res>
    extends _$NotionPagePropertyTitleCopyWithImpl<$Res,
        _$_NotionPagePropertyTitle>
    implements _$$_NotionPagePropertyTitleCopyWith<$Res> {
  __$$_NotionPagePropertyTitleCopyWithImpl(_$_NotionPagePropertyTitle _value,
      $Res Function(_$_NotionPagePropertyTitle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
  }) {
    return _then(_$_NotionPagePropertyTitle(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value._title
          : title // ignore: cast_nullable_to_non_nullable
              as List<NotionRichText>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPagePropertyTitle implements _NotionPagePropertyTitle {
  const _$_NotionPagePropertyTitle(
      {required this.id,
      required this.type,
      required final List<NotionRichText> title})
      : _title = title;

  factory _$_NotionPagePropertyTitle.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPagePropertyTitleFromJson(json);

  @override
  final String id;
  @override
  final String type;
  final List<NotionRichText> _title;
  @override
  List<NotionRichText> get title {
    if (_title is EqualUnmodifiableListView) return _title;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_title);
  }

  @override
  String toString() {
    return 'NotionPagePropertyTitle(id: $id, type: $type, title: $title)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPagePropertyTitleCopyWith<_$_NotionPagePropertyTitle>
      get copyWith =>
          __$$_NotionPagePropertyTitleCopyWithImpl<_$_NotionPagePropertyTitle>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPagePropertyTitleToJson(
      this,
    );
  }
}

abstract class _NotionPagePropertyTitle
    implements NotionPagePropertyTitle, NotionPageProperty {
  const factory _NotionPagePropertyTitle(
      {required final String id,
      required final String type,
      required final List<NotionRichText> title}) = _$_NotionPagePropertyTitle;

  factory _NotionPagePropertyTitle.fromJson(Map<String, dynamic> json) =
      _$_NotionPagePropertyTitle.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  List<NotionRichText> get title;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPagePropertyTitleCopyWith<_$_NotionPagePropertyTitle>
      get copyWith => throw _privateConstructorUsedError;
}
