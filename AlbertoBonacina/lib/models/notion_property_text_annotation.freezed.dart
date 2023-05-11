// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_property_text_annotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPropertyTextAnnotation _$NotionPropertyTextAnnotationFromJson(
    Map<String, dynamic> json) {
  return _NotionPropertyTextAnnotation.fromJson(json);
}

/// @nodoc
mixin _$NotionPropertyTextAnnotation {
  bool get bold => throw _privateConstructorUsedError;
  bool get italic => throw _privateConstructorUsedError;
  bool get strikethrough => throw _privateConstructorUsedError;
  bool get underline => throw _privateConstructorUsedError;
  bool get code => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPropertyTextAnnotationCopyWith<NotionPropertyTextAnnotation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPropertyTextAnnotationCopyWith<$Res> {
  factory $NotionPropertyTextAnnotationCopyWith(
          NotionPropertyTextAnnotation value,
          $Res Function(NotionPropertyTextAnnotation) then) =
      _$NotionPropertyTextAnnotationCopyWithImpl<$Res,
          NotionPropertyTextAnnotation>;
  @useResult
  $Res call(
      {bool bold,
      bool italic,
      bool strikethrough,
      bool underline,
      bool code,
      String color});
}

/// @nodoc
class _$NotionPropertyTextAnnotationCopyWithImpl<$Res,
        $Val extends NotionPropertyTextAnnotation>
    implements $NotionPropertyTextAnnotationCopyWith<$Res> {
  _$NotionPropertyTextAnnotationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bold = null,
    Object? italic = null,
    Object? strikethrough = null,
    Object? underline = null,
    Object? code = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      bold: null == bold
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool,
      italic: null == italic
          ? _value.italic
          : italic // ignore: cast_nullable_to_non_nullable
              as bool,
      strikethrough: null == strikethrough
          ? _value.strikethrough
          : strikethrough // ignore: cast_nullable_to_non_nullable
              as bool,
      underline: null == underline
          ? _value.underline
          : underline // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionPropertyTextAnnotationCopyWith<$Res>
    implements $NotionPropertyTextAnnotationCopyWith<$Res> {
  factory _$$_NotionPropertyTextAnnotationCopyWith(
          _$_NotionPropertyTextAnnotation value,
          $Res Function(_$_NotionPropertyTextAnnotation) then) =
      __$$_NotionPropertyTextAnnotationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool bold,
      bool italic,
      bool strikethrough,
      bool underline,
      bool code,
      String color});
}

/// @nodoc
class __$$_NotionPropertyTextAnnotationCopyWithImpl<$Res>
    extends _$NotionPropertyTextAnnotationCopyWithImpl<$Res,
        _$_NotionPropertyTextAnnotation>
    implements _$$_NotionPropertyTextAnnotationCopyWith<$Res> {
  __$$_NotionPropertyTextAnnotationCopyWithImpl(
      _$_NotionPropertyTextAnnotation _value,
      $Res Function(_$_NotionPropertyTextAnnotation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bold = null,
    Object? italic = null,
    Object? strikethrough = null,
    Object? underline = null,
    Object? code = null,
    Object? color = null,
  }) {
    return _then(_$_NotionPropertyTextAnnotation(
      bold: null == bold
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool,
      italic: null == italic
          ? _value.italic
          : italic // ignore: cast_nullable_to_non_nullable
              as bool,
      strikethrough: null == strikethrough
          ? _value.strikethrough
          : strikethrough // ignore: cast_nullable_to_non_nullable
              as bool,
      underline: null == underline
          ? _value.underline
          : underline // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as bool,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPropertyTextAnnotation implements _NotionPropertyTextAnnotation {
  const _$_NotionPropertyTextAnnotation(
      {required this.bold,
      required this.italic,
      required this.strikethrough,
      required this.underline,
      required this.code,
      required this.color});

  factory _$_NotionPropertyTextAnnotation.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPropertyTextAnnotationFromJson(json);

  @override
  final bool bold;
  @override
  final bool italic;
  @override
  final bool strikethrough;
  @override
  final bool underline;
  @override
  final bool code;
  @override
  final String color;

  @override
  String toString() {
    return 'NotionPropertyTextAnnotation(bold: $bold, italic: $italic, strikethrough: $strikethrough, underline: $underline, code: $code, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotionPropertyTextAnnotation &&
            (identical(other.bold, bold) || other.bold == bold) &&
            (identical(other.italic, italic) || other.italic == italic) &&
            (identical(other.strikethrough, strikethrough) ||
                other.strikethrough == strikethrough) &&
            (identical(other.underline, underline) ||
                other.underline == underline) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bold, italic, strikethrough, underline, code, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPropertyTextAnnotationCopyWith<_$_NotionPropertyTextAnnotation>
      get copyWith => __$$_NotionPropertyTextAnnotationCopyWithImpl<
          _$_NotionPropertyTextAnnotation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPropertyTextAnnotationToJson(
      this,
    );
  }
}

abstract class _NotionPropertyTextAnnotation
    implements NotionPropertyTextAnnotation {
  const factory _NotionPropertyTextAnnotation(
      {required final bool bold,
      required final bool italic,
      required final bool strikethrough,
      required final bool underline,
      required final bool code,
      required final String color}) = _$_NotionPropertyTextAnnotation;

  factory _NotionPropertyTextAnnotation.fromJson(Map<String, dynamic> json) =
      _$_NotionPropertyTextAnnotation.fromJson;

  @override
  bool get bold;
  @override
  bool get italic;
  @override
  bool get strikethrough;
  @override
  bool get underline;
  @override
  bool get code;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPropertyTextAnnotationCopyWith<_$_NotionPropertyTextAnnotation>
      get copyWith => throw _privateConstructorUsedError;
}
