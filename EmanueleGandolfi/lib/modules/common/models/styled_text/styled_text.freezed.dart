// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'styled_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StyledText {
  String get text => throw _privateConstructorUsedError;
  TextStyle get style => throw _privateConstructorUsedError;
  String? get href => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StyledTextCopyWith<StyledText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyledTextCopyWith<$Res> {
  factory $StyledTextCopyWith(
          StyledText value, $Res Function(StyledText) then) =
      _$StyledTextCopyWithImpl<$Res, StyledText>;
  @useResult
  $Res call({String text, TextStyle style, String? href});
}

/// @nodoc
class _$StyledTextCopyWithImpl<$Res, $Val extends StyledText>
    implements $StyledTextCopyWith<$Res> {
  _$StyledTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? style = null,
    Object? href = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StyledTextCopyWith<$Res>
    implements $StyledTextCopyWith<$Res> {
  factory _$$_StyledTextCopyWith(
          _$_StyledText value, $Res Function(_$_StyledText) then) =
      __$$_StyledTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, TextStyle style, String? href});
}

/// @nodoc
class __$$_StyledTextCopyWithImpl<$Res>
    extends _$StyledTextCopyWithImpl<$Res, _$_StyledText>
    implements _$$_StyledTextCopyWith<$Res> {
  __$$_StyledTextCopyWithImpl(
      _$_StyledText _value, $Res Function(_$_StyledText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? style = null,
    Object? href = freezed,
  }) {
    return _then(_$_StyledText(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_StyledText implements _StyledText {
  const _$_StyledText(
      {required this.text, required this.style, required this.href});

  @override
  final String text;
  @override
  final TextStyle style;
  @override
  final String? href;

  @override
  String toString() {
    return 'StyledText(text: $text, style: $style, href: $href)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StyledTextCopyWith<_$_StyledText> get copyWith =>
      __$$_StyledTextCopyWithImpl<_$_StyledText>(this, _$identity);
}

abstract class _StyledText implements StyledText {
  const factory _StyledText(
      {required final String text,
      required final TextStyle style,
      required final String? href}) = _$_StyledText;

  @override
  String get text;
  @override
  TextStyle get style;
  @override
  String? get href;
  @override
  @JsonKey(ignore: true)
  _$$_StyledTextCopyWith<_$_StyledText> get copyWith =>
      throw _privateConstructorUsedError;
}
