// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_filter_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionFilterCondition _$NotionFilterConditionFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'equals':
      return NotionFilterConditionEquals.fromJson(json);
    case 'contains':
      return NotionFilterConditionContains.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'NotionFilterCondition',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$NotionFilterCondition {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String equals) equals,
    required TResult Function(String contains) contains,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String equals)? equals,
    TResult? Function(String contains)? contains,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String equals)? equals,
    TResult Function(String contains)? contains,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionFilterConditionEquals value) equals,
    required TResult Function(NotionFilterConditionContains value) contains,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionFilterConditionEquals value)? equals,
    TResult? Function(NotionFilterConditionContains value)? contains,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionFilterConditionEquals value)? equals,
    TResult Function(NotionFilterConditionContains value)? contains,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionFilterConditionCopyWith<$Res> {
  factory $NotionFilterConditionCopyWith(NotionFilterCondition value,
          $Res Function(NotionFilterCondition) then) =
      _$NotionFilterConditionCopyWithImpl<$Res, NotionFilterCondition>;
}

/// @nodoc
class _$NotionFilterConditionCopyWithImpl<$Res,
        $Val extends NotionFilterCondition>
    implements $NotionFilterConditionCopyWith<$Res> {
  _$NotionFilterConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotionFilterConditionEqualsCopyWith<$Res> {
  factory _$$NotionFilterConditionEqualsCopyWith(
          _$NotionFilterConditionEquals value,
          $Res Function(_$NotionFilterConditionEquals) then) =
      __$$NotionFilterConditionEqualsCopyWithImpl<$Res>;
  @useResult
  $Res call({String equals});
}

/// @nodoc
class __$$NotionFilterConditionEqualsCopyWithImpl<$Res>
    extends _$NotionFilterConditionCopyWithImpl<$Res,
        _$NotionFilterConditionEquals>
    implements _$$NotionFilterConditionEqualsCopyWith<$Res> {
  __$$NotionFilterConditionEqualsCopyWithImpl(
      _$NotionFilterConditionEquals _value,
      $Res Function(_$NotionFilterConditionEquals) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equals = null,
  }) {
    return _then(_$NotionFilterConditionEquals(
      null == equals
          ? _value.equals
          : equals // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionFilterConditionEquals implements NotionFilterConditionEquals {
  const _$NotionFilterConditionEquals(this.equals, {final String? $type})
      : $type = $type ?? 'equals';

  factory _$NotionFilterConditionEquals.fromJson(Map<String, dynamic> json) =>
      _$$NotionFilterConditionEqualsFromJson(json);

  @override
  final String equals;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotionFilterCondition.equals(equals: $equals)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionFilterConditionEqualsCopyWith<_$NotionFilterConditionEquals>
      get copyWith => __$$NotionFilterConditionEqualsCopyWithImpl<
          _$NotionFilterConditionEquals>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String equals) equals,
    required TResult Function(String contains) contains,
  }) {
    return equals(this.equals);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String equals)? equals,
    TResult? Function(String contains)? contains,
  }) {
    return equals?.call(this.equals);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String equals)? equals,
    TResult Function(String contains)? contains,
    required TResult orElse(),
  }) {
    if (equals != null) {
      return equals(this.equals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionFilterConditionEquals value) equals,
    required TResult Function(NotionFilterConditionContains value) contains,
  }) {
    return equals(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionFilterConditionEquals value)? equals,
    TResult? Function(NotionFilterConditionContains value)? contains,
  }) {
    return equals?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionFilterConditionEquals value)? equals,
    TResult Function(NotionFilterConditionContains value)? contains,
    required TResult orElse(),
  }) {
    if (equals != null) {
      return equals(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionFilterConditionEqualsToJson(
      this,
    );
  }
}

abstract class NotionFilterConditionEquals implements NotionFilterCondition {
  const factory NotionFilterConditionEquals(final String equals) =
      _$NotionFilterConditionEquals;

  factory NotionFilterConditionEquals.fromJson(Map<String, dynamic> json) =
      _$NotionFilterConditionEquals.fromJson;

  String get equals;
  @JsonKey(ignore: true)
  _$$NotionFilterConditionEqualsCopyWith<_$NotionFilterConditionEquals>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotionFilterConditionContainsCopyWith<$Res> {
  factory _$$NotionFilterConditionContainsCopyWith(
          _$NotionFilterConditionContains value,
          $Res Function(_$NotionFilterConditionContains) then) =
      __$$NotionFilterConditionContainsCopyWithImpl<$Res>;
  @useResult
  $Res call({String contains});
}

/// @nodoc
class __$$NotionFilterConditionContainsCopyWithImpl<$Res>
    extends _$NotionFilterConditionCopyWithImpl<$Res,
        _$NotionFilterConditionContains>
    implements _$$NotionFilterConditionContainsCopyWith<$Res> {
  __$$NotionFilterConditionContainsCopyWithImpl(
      _$NotionFilterConditionContains _value,
      $Res Function(_$NotionFilterConditionContains) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contains = null,
  }) {
    return _then(_$NotionFilterConditionContains(
      null == contains
          ? _value.contains
          : contains // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionFilterConditionContains implements NotionFilterConditionContains {
  const _$NotionFilterConditionContains(this.contains, {final String? $type})
      : $type = $type ?? 'contains';

  factory _$NotionFilterConditionContains.fromJson(Map<String, dynamic> json) =>
      _$$NotionFilterConditionContainsFromJson(json);

  @override
  final String contains;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotionFilterCondition.contains(contains: $contains)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionFilterConditionContainsCopyWith<_$NotionFilterConditionContains>
      get copyWith => __$$NotionFilterConditionContainsCopyWithImpl<
          _$NotionFilterConditionContains>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String equals) equals,
    required TResult Function(String contains) contains,
  }) {
    return contains(this.contains);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String equals)? equals,
    TResult? Function(String contains)? contains,
  }) {
    return contains?.call(this.contains);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String equals)? equals,
    TResult Function(String contains)? contains,
    required TResult orElse(),
  }) {
    if (contains != null) {
      return contains(this.contains);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotionFilterConditionEquals value) equals,
    required TResult Function(NotionFilterConditionContains value) contains,
  }) {
    return contains(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotionFilterConditionEquals value)? equals,
    TResult? Function(NotionFilterConditionContains value)? contains,
  }) {
    return contains?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotionFilterConditionEquals value)? equals,
    TResult Function(NotionFilterConditionContains value)? contains,
    required TResult orElse(),
  }) {
    if (contains != null) {
      return contains(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionFilterConditionContainsToJson(
      this,
    );
  }
}

abstract class NotionFilterConditionContains implements NotionFilterCondition {
  const factory NotionFilterConditionContains(final String contains) =
      _$NotionFilterConditionContains;

  factory NotionFilterConditionContains.fromJson(Map<String, dynamic> json) =
      _$NotionFilterConditionContains.fromJson;

  String get contains;
  @JsonKey(ignore: true)
  _$$NotionFilterConditionContainsCopyWith<_$NotionFilterConditionContains>
      get copyWith => throw _privateConstructorUsedError;
}
