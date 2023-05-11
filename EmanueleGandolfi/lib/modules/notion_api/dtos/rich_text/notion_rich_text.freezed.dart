// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_rich_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionRichText _$NotionRichTextFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'text':
      return NotionRichTextTypeText.fromJson(json);
    case 'mention':
      return NotionRichTextTypeMention.fromJson(json);
    case 'equation':
      return NotionRichTextTypeEquation.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'NotionRichText',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$NotionRichText {
  NotionRichTextAnnotations get annotations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'plain_text')
  String get plainText => throw _privateConstructorUsedError;
  String? get href => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)
        text,
    required TResult Function(
            dynamic mention,
            NotionRichTextAnnotations annotations,
            String plainText,
            String? href)
        mention,
    required TResult Function(
            dynamic equation,
            NotionRichTextAnnotations annotations,
            String plainText,
            String? href)
        equation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)?
        text,
    TResult? Function(dynamic mention, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        mention,
    TResult? Function(dynamic equation, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        equation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)?
        text,
    TResult Function(dynamic mention, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        mention,
    TResult Function(dynamic equation, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        equation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionRichTextTypeText value) text,
    required TResult Function(NotionRichTextTypeMention value) mention,
    required TResult Function(NotionRichTextTypeEquation value) equation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionRichTextTypeText value)? text,
    TResult? Function(NotionRichTextTypeMention value)? mention,
    TResult? Function(NotionRichTextTypeEquation value)? equation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionRichTextTypeText value)? text,
    TResult Function(NotionRichTextTypeMention value)? mention,
    TResult Function(NotionRichTextTypeEquation value)? equation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionRichTextCopyWith<NotionRichText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionRichTextCopyWith<$Res> {
  factory $NotionRichTextCopyWith(
          NotionRichText value, $Res Function(NotionRichText) then) =
      _$NotionRichTextCopyWithImpl<$Res, NotionRichText>;
  @useResult
  $Res call(
      {NotionRichTextAnnotations annotations,
      @JsonKey(name: 'plain_text') String plainText,
      String? href});

  $NotionRichTextAnnotationsCopyWith<$Res> get annotations;
}

/// @nodoc
class _$NotionRichTextCopyWithImpl<$Res, $Val extends NotionRichText>
    implements $NotionRichTextCopyWith<$Res> {
  _$NotionRichTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annotations = null,
    Object? plainText = null,
    Object? href = freezed,
  }) {
    return _then(_value.copyWith(
      annotations: null == annotations
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as NotionRichTextAnnotations,
      plainText: null == plainText
          ? _value.plainText
          : plainText // ignore: cast_nullable_to_non_nullable
              as String,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionRichTextAnnotationsCopyWith<$Res> get annotations {
    return $NotionRichTextAnnotationsCopyWith<$Res>(_value.annotations,
        (value) {
      return _then(_value.copyWith(annotations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotionRichTextTypeTextCopyWith<$Res>
    implements $NotionRichTextCopyWith<$Res> {
  factory _$$NotionRichTextTypeTextCopyWith(_$NotionRichTextTypeText value,
          $Res Function(_$NotionRichTextTypeText) then) =
      __$$NotionRichTextTypeTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NotionRichTextContentText text,
      NotionRichTextAnnotations annotations,
      @JsonKey(name: 'plain_text') String plainText,
      String? href});

  $NotionRichTextContentTextCopyWith<$Res> get text;
  @override
  $NotionRichTextAnnotationsCopyWith<$Res> get annotations;
}

/// @nodoc
class __$$NotionRichTextTypeTextCopyWithImpl<$Res>
    extends _$NotionRichTextCopyWithImpl<$Res, _$NotionRichTextTypeText>
    implements _$$NotionRichTextTypeTextCopyWith<$Res> {
  __$$NotionRichTextTypeTextCopyWithImpl(_$NotionRichTextTypeText _value,
      $Res Function(_$NotionRichTextTypeText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? annotations = null,
    Object? plainText = null,
    Object? href = freezed,
  }) {
    return _then(_$NotionRichTextTypeText(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as NotionRichTextContentText,
      null == annotations
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as NotionRichTextAnnotations,
      null == plainText
          ? _value.plainText
          : plainText // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionRichTextContentTextCopyWith<$Res> get text {
    return $NotionRichTextContentTextCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionRichTextTypeText implements NotionRichTextTypeText {
  const _$NotionRichTextTypeText(this.text, this.annotations,
      @JsonKey(name: 'plain_text') this.plainText, this.href,
      {final String? $type})
      : $type = $type ?? 'text';

  factory _$NotionRichTextTypeText.fromJson(Map<String, dynamic> json) =>
      _$$NotionRichTextTypeTextFromJson(json);

  @override
  final NotionRichTextContentText text;
  @override
  final NotionRichTextAnnotations annotations;
  @override
  @JsonKey(name: 'plain_text')
  final String plainText;
  @override
  final String? href;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'NotionRichText.text(text: $text, annotations: $annotations, plainText: $plainText, href: $href)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionRichTextTypeTextCopyWith<_$NotionRichTextTypeText> get copyWith =>
      __$$NotionRichTextTypeTextCopyWithImpl<_$NotionRichTextTypeText>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)
        text,
    required TResult Function(
            dynamic mention,
            NotionRichTextAnnotations annotations,
            String plainText,
            String? href)
        mention,
    required TResult Function(
            dynamic equation,
            NotionRichTextAnnotations annotations,
            String plainText,
            String? href)
        equation,
  }) {
    return text(this.text, annotations, plainText, href);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)?
        text,
    TResult? Function(dynamic mention, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        mention,
    TResult? Function(dynamic equation, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        equation,
  }) {
    return text?.call(this.text, annotations, plainText, href);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)?
        text,
    TResult Function(dynamic mention, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        mention,
    TResult Function(dynamic equation, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        equation,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text, annotations, plainText, href);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionRichTextTypeText value) text,
    required TResult Function(NotionRichTextTypeMention value) mention,
    required TResult Function(NotionRichTextTypeEquation value) equation,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionRichTextTypeText value)? text,
    TResult? Function(NotionRichTextTypeMention value)? mention,
    TResult? Function(NotionRichTextTypeEquation value)? equation,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionRichTextTypeText value)? text,
    TResult Function(NotionRichTextTypeMention value)? mention,
    TResult Function(NotionRichTextTypeEquation value)? equation,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionRichTextTypeTextToJson(
      this,
    );
  }
}

abstract class NotionRichTextTypeText implements NotionRichText {
  const factory NotionRichTextTypeText(
      final NotionRichTextContentText text,
      final NotionRichTextAnnotations annotations,
      @JsonKey(name: 'plain_text') final String plainText,
      final String? href) = _$NotionRichTextTypeText;

  factory NotionRichTextTypeText.fromJson(Map<String, dynamic> json) =
      _$NotionRichTextTypeText.fromJson;

  NotionRichTextContentText get text;
  @override
  NotionRichTextAnnotations get annotations;
  @override
  @JsonKey(name: 'plain_text')
  String get plainText;
  @override
  String? get href;
  @override
  @JsonKey(ignore: true)
  _$$NotionRichTextTypeTextCopyWith<_$NotionRichTextTypeText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotionRichTextTypeMentionCopyWith<$Res>
    implements $NotionRichTextCopyWith<$Res> {
  factory _$$NotionRichTextTypeMentionCopyWith(
          _$NotionRichTextTypeMention value,
          $Res Function(_$NotionRichTextTypeMention) then) =
      __$$NotionRichTextTypeMentionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic mention,
      NotionRichTextAnnotations annotations,
      String plainText,
      String? href});

  @override
  $NotionRichTextAnnotationsCopyWith<$Res> get annotations;
}

/// @nodoc
class __$$NotionRichTextTypeMentionCopyWithImpl<$Res>
    extends _$NotionRichTextCopyWithImpl<$Res, _$NotionRichTextTypeMention>
    implements _$$NotionRichTextTypeMentionCopyWith<$Res> {
  __$$NotionRichTextTypeMentionCopyWithImpl(_$NotionRichTextTypeMention _value,
      $Res Function(_$NotionRichTextTypeMention) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mention = freezed,
    Object? annotations = null,
    Object? plainText = null,
    Object? href = freezed,
  }) {
    return _then(_$NotionRichTextTypeMention(
      freezed == mention
          ? _value.mention
          : mention // ignore: cast_nullable_to_non_nullable
              as dynamic,
      null == annotations
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as NotionRichTextAnnotations,
      null == plainText
          ? _value.plainText
          : plainText // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionRichTextTypeMention implements NotionRichTextTypeMention {
  const _$NotionRichTextTypeMention(
      this.mention, this.annotations, this.plainText, this.href,
      {final String? $type})
      : $type = $type ?? 'mention';

  factory _$NotionRichTextTypeMention.fromJson(Map<String, dynamic> json) =>
      _$$NotionRichTextTypeMentionFromJson(json);

  @override
  final dynamic mention;
// TODO parse and handle the mention object
  @override
  final NotionRichTextAnnotations annotations;
  @override
  final String plainText;
  @override
  final String? href;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'NotionRichText.mention(mention: $mention, annotations: $annotations, plainText: $plainText, href: $href)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionRichTextTypeMentionCopyWith<_$NotionRichTextTypeMention>
      get copyWith => __$$NotionRichTextTypeMentionCopyWithImpl<
          _$NotionRichTextTypeMention>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)
        text,
    required TResult Function(
            dynamic mention,
            NotionRichTextAnnotations annotations,
            String plainText,
            String? href)
        mention,
    required TResult Function(
            dynamic equation,
            NotionRichTextAnnotations annotations,
            String plainText,
            String? href)
        equation,
  }) {
    return mention(this.mention, annotations, plainText, href);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)?
        text,
    TResult? Function(dynamic mention, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        mention,
    TResult? Function(dynamic equation, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        equation,
  }) {
    return mention?.call(this.mention, annotations, plainText, href);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)?
        text,
    TResult Function(dynamic mention, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        mention,
    TResult Function(dynamic equation, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        equation,
    required TResult orElse(),
  }) {
    if (mention != null) {
      return mention(this.mention, annotations, plainText, href);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionRichTextTypeText value) text,
    required TResult Function(NotionRichTextTypeMention value) mention,
    required TResult Function(NotionRichTextTypeEquation value) equation,
  }) {
    return mention(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionRichTextTypeText value)? text,
    TResult? Function(NotionRichTextTypeMention value)? mention,
    TResult? Function(NotionRichTextTypeEquation value)? equation,
  }) {
    return mention?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionRichTextTypeText value)? text,
    TResult Function(NotionRichTextTypeMention value)? mention,
    TResult Function(NotionRichTextTypeEquation value)? equation,
    required TResult orElse(),
  }) {
    if (mention != null) {
      return mention(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionRichTextTypeMentionToJson(
      this,
    );
  }
}

abstract class NotionRichTextTypeMention implements NotionRichText {
  const factory NotionRichTextTypeMention(
      final dynamic mention,
      final NotionRichTextAnnotations annotations,
      final String plainText,
      final String? href) = _$NotionRichTextTypeMention;

  factory NotionRichTextTypeMention.fromJson(Map<String, dynamic> json) =
      _$NotionRichTextTypeMention.fromJson;

  dynamic get mention;
  @override // TODO parse and handle the mention object
  NotionRichTextAnnotations get annotations;
  @override
  String get plainText;
  @override
  String? get href;
  @override
  @JsonKey(ignore: true)
  _$$NotionRichTextTypeMentionCopyWith<_$NotionRichTextTypeMention>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotionRichTextTypeEquationCopyWith<$Res>
    implements $NotionRichTextCopyWith<$Res> {
  factory _$$NotionRichTextTypeEquationCopyWith(
          _$NotionRichTextTypeEquation value,
          $Res Function(_$NotionRichTextTypeEquation) then) =
      __$$NotionRichTextTypeEquationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic equation,
      NotionRichTextAnnotations annotations,
      String plainText,
      String? href});

  @override
  $NotionRichTextAnnotationsCopyWith<$Res> get annotations;
}

/// @nodoc
class __$$NotionRichTextTypeEquationCopyWithImpl<$Res>
    extends _$NotionRichTextCopyWithImpl<$Res, _$NotionRichTextTypeEquation>
    implements _$$NotionRichTextTypeEquationCopyWith<$Res> {
  __$$NotionRichTextTypeEquationCopyWithImpl(
      _$NotionRichTextTypeEquation _value,
      $Res Function(_$NotionRichTextTypeEquation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equation = freezed,
    Object? annotations = null,
    Object? plainText = null,
    Object? href = freezed,
  }) {
    return _then(_$NotionRichTextTypeEquation(
      freezed == equation
          ? _value.equation
          : equation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      null == annotations
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as NotionRichTextAnnotations,
      null == plainText
          ? _value.plainText
          : plainText // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionRichTextTypeEquation implements NotionRichTextTypeEquation {
  const _$NotionRichTextTypeEquation(
      this.equation, this.annotations, this.plainText, this.href,
      {final String? $type})
      : $type = $type ?? 'equation';

  factory _$NotionRichTextTypeEquation.fromJson(Map<String, dynamic> json) =>
      _$$NotionRichTextTypeEquationFromJson(json);

  @override
  final dynamic equation;
// TODO parse and handle the equation object
  @override
  final NotionRichTextAnnotations annotations;
  @override
  final String plainText;
  @override
  final String? href;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'NotionRichText.equation(equation: $equation, annotations: $annotations, plainText: $plainText, href: $href)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionRichTextTypeEquationCopyWith<_$NotionRichTextTypeEquation>
      get copyWith => __$$NotionRichTextTypeEquationCopyWithImpl<
          _$NotionRichTextTypeEquation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)
        text,
    required TResult Function(
            dynamic mention,
            NotionRichTextAnnotations annotations,
            String plainText,
            String? href)
        mention,
    required TResult Function(
            dynamic equation,
            NotionRichTextAnnotations annotations,
            String plainText,
            String? href)
        equation,
  }) {
    return equation(this.equation, annotations, plainText, href);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)?
        text,
    TResult? Function(dynamic mention, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        mention,
    TResult? Function(dynamic equation, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        equation,
  }) {
    return equation?.call(this.equation, annotations, plainText, href);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            NotionRichTextContentText text,
            NotionRichTextAnnotations annotations,
            @JsonKey(name: 'plain_text') String plainText,
            String? href)?
        text,
    TResult Function(dynamic mention, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        mention,
    TResult Function(dynamic equation, NotionRichTextAnnotations annotations,
            String plainText, String? href)?
        equation,
    required TResult orElse(),
  }) {
    if (equation != null) {
      return equation(this.equation, annotations, plainText, href);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionRichTextTypeText value) text,
    required TResult Function(NotionRichTextTypeMention value) mention,
    required TResult Function(NotionRichTextTypeEquation value) equation,
  }) {
    return equation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionRichTextTypeText value)? text,
    TResult? Function(NotionRichTextTypeMention value)? mention,
    TResult? Function(NotionRichTextTypeEquation value)? equation,
  }) {
    return equation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionRichTextTypeText value)? text,
    TResult Function(NotionRichTextTypeMention value)? mention,
    TResult Function(NotionRichTextTypeEquation value)? equation,
    required TResult orElse(),
  }) {
    if (equation != null) {
      return equation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionRichTextTypeEquationToJson(
      this,
    );
  }
}

abstract class NotionRichTextTypeEquation implements NotionRichText {
  const factory NotionRichTextTypeEquation(
      final dynamic equation,
      final NotionRichTextAnnotations annotations,
      final String plainText,
      final String? href) = _$NotionRichTextTypeEquation;

  factory NotionRichTextTypeEquation.fromJson(Map<String, dynamic> json) =
      _$NotionRichTextTypeEquation.fromJson;

  dynamic get equation;
  @override // TODO parse and handle the equation object
  NotionRichTextAnnotations get annotations;
  @override
  String get plainText;
  @override
  String? get href;
  @override
  @JsonKey(ignore: true)
  _$$NotionRichTextTypeEquationCopyWith<_$NotionRichTextTypeEquation>
      get copyWith => throw _privateConstructorUsedError;
}
