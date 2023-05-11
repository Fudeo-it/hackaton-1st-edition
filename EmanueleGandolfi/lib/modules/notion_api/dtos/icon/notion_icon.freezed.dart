// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_icon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionIcon _$NotionIconFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'emoji':
      return NotionIconEmoji.fromJson(json);
    case 'external':
      return NotionIconExternal.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'NotionIcon', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$NotionIcon {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emoji) emoji,
    required TResult Function(String url) external,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emoji)? emoji,
    TResult? Function(String url)? external,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emoji)? emoji,
    TResult Function(String url)? external,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionIconEmoji value) emoji,
    required TResult Function(NotionIconExternal value) external,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionIconEmoji value)? emoji,
    TResult? Function(NotionIconExternal value)? external,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionIconEmoji value)? emoji,
    TResult Function(NotionIconExternal value)? external,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionIconCopyWith<$Res> {
  factory $NotionIconCopyWith(
          NotionIcon value, $Res Function(NotionIcon) then) =
      _$NotionIconCopyWithImpl<$Res, NotionIcon>;
}

/// @nodoc
class _$NotionIconCopyWithImpl<$Res, $Val extends NotionIcon>
    implements $NotionIconCopyWith<$Res> {
  _$NotionIconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotionIconEmojiCopyWith<$Res> {
  factory _$$NotionIconEmojiCopyWith(
          _$NotionIconEmoji value, $Res Function(_$NotionIconEmoji) then) =
      __$$NotionIconEmojiCopyWithImpl<$Res>;
  @useResult
  $Res call({String emoji});
}

/// @nodoc
class __$$NotionIconEmojiCopyWithImpl<$Res>
    extends _$NotionIconCopyWithImpl<$Res, _$NotionIconEmoji>
    implements _$$NotionIconEmojiCopyWith<$Res> {
  __$$NotionIconEmojiCopyWithImpl(
      _$NotionIconEmoji _value, $Res Function(_$NotionIconEmoji) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emoji = null,
  }) {
    return _then(_$NotionIconEmoji(
      null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionIconEmoji implements NotionIconEmoji {
  const _$NotionIconEmoji(this.emoji, {final String? $type})
      : $type = $type ?? 'emoji';

  factory _$NotionIconEmoji.fromJson(Map<String, dynamic> json) =>
      _$$NotionIconEmojiFromJson(json);

  @override
  final String emoji;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'NotionIcon.emoji(emoji: $emoji)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionIconEmojiCopyWith<_$NotionIconEmoji> get copyWith =>
      __$$NotionIconEmojiCopyWithImpl<_$NotionIconEmoji>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emoji) emoji,
    required TResult Function(String url) external,
  }) {
    return emoji(this.emoji);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emoji)? emoji,
    TResult? Function(String url)? external,
  }) {
    return emoji?.call(this.emoji);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emoji)? emoji,
    TResult Function(String url)? external,
    required TResult orElse(),
  }) {
    if (emoji != null) {
      return emoji(this.emoji);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionIconEmoji value) emoji,
    required TResult Function(NotionIconExternal value) external,
  }) {
    return emoji(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionIconEmoji value)? emoji,
    TResult? Function(NotionIconExternal value)? external,
  }) {
    return emoji?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionIconEmoji value)? emoji,
    TResult Function(NotionIconExternal value)? external,
    required TResult orElse(),
  }) {
    if (emoji != null) {
      return emoji(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionIconEmojiToJson(
      this,
    );
  }
}

abstract class NotionIconEmoji implements NotionIcon {
  const factory NotionIconEmoji(final String emoji) = _$NotionIconEmoji;

  factory NotionIconEmoji.fromJson(Map<String, dynamic> json) =
      _$NotionIconEmoji.fromJson;

  String get emoji;
  @JsonKey(ignore: true)
  _$$NotionIconEmojiCopyWith<_$NotionIconEmoji> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotionIconExternalCopyWith<$Res> {
  factory _$$NotionIconExternalCopyWith(_$NotionIconExternal value,
          $Res Function(_$NotionIconExternal) then) =
      __$$NotionIconExternalCopyWithImpl<$Res>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$NotionIconExternalCopyWithImpl<$Res>
    extends _$NotionIconCopyWithImpl<$Res, _$NotionIconExternal>
    implements _$$NotionIconExternalCopyWith<$Res> {
  __$$NotionIconExternalCopyWithImpl(
      _$NotionIconExternal _value, $Res Function(_$NotionIconExternal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$NotionIconExternal(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionIconExternal implements NotionIconExternal {
  const _$NotionIconExternal(this.url, {final String? $type})
      : $type = $type ?? 'external';

  factory _$NotionIconExternal.fromJson(Map<String, dynamic> json) =>
      _$$NotionIconExternalFromJson(json);

  @override
  final String url;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'NotionIcon.external(url: $url)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionIconExternalCopyWith<_$NotionIconExternal> get copyWith =>
      __$$NotionIconExternalCopyWithImpl<_$NotionIconExternal>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emoji) emoji,
    required TResult Function(String url) external,
  }) {
    return external(url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emoji)? emoji,
    TResult? Function(String url)? external,
  }) {
    return external?.call(url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emoji)? emoji,
    TResult Function(String url)? external,
    required TResult orElse(),
  }) {
    if (external != null) {
      return external(url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionIconEmoji value) emoji,
    required TResult Function(NotionIconExternal value) external,
  }) {
    return external(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionIconEmoji value)? emoji,
    TResult? Function(NotionIconExternal value)? external,
  }) {
    return external?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionIconEmoji value)? emoji,
    TResult Function(NotionIconExternal value)? external,
    required TResult orElse(),
  }) {
    if (external != null) {
      return external(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionIconExternalToJson(
      this,
    );
  }
}

abstract class NotionIconExternal implements NotionIcon {
  const factory NotionIconExternal(final String url) = _$NotionIconExternal;

  factory NotionIconExternal.fromJson(Map<String, dynamic> json) =
      _$NotionIconExternal.fromJson;

  String get url;
  @JsonKey(ignore: true)
  _$$NotionIconExternalCopyWith<_$NotionIconExternal> get copyWith =>
      throw _privateConstructorUsedError;
}
