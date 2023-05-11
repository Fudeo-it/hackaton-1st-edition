// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectOption {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectOptionCopyWith<SelectOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectOptionCopyWith<$Res> {
  factory $SelectOptionCopyWith(
          SelectOption value, $Res Function(SelectOption) then) =
      _$SelectOptionCopyWithImpl<$Res, SelectOption>;
  @useResult
  $Res call({String id, String name, Color? color});
}

/// @nodoc
class _$SelectOptionCopyWithImpl<$Res, $Val extends SelectOption>
    implements $SelectOptionCopyWith<$Res> {
  _$SelectOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectOptionCopyWith<$Res>
    implements $SelectOptionCopyWith<$Res> {
  factory _$$_SelectOptionCopyWith(
          _$_SelectOption value, $Res Function(_$_SelectOption) then) =
      __$$_SelectOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, Color? color});
}

/// @nodoc
class __$$_SelectOptionCopyWithImpl<$Res>
    extends _$SelectOptionCopyWithImpl<$Res, _$_SelectOption>
    implements _$$_SelectOptionCopyWith<$Res> {
  __$$_SelectOptionCopyWithImpl(
      _$_SelectOption _value, $Res Function(_$_SelectOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = freezed,
  }) {
    return _then(_$_SelectOption(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_SelectOption implements _SelectOption {
  const _$_SelectOption(
      {required this.id, required this.name, required this.color});

  @override
  final String id;
  @override
  final String name;
  @override
  final Color? color;

  @override
  String toString() {
    return 'SelectOption(id: $id, name: $name, color: $color)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectOptionCopyWith<_$_SelectOption> get copyWith =>
      __$$_SelectOptionCopyWithImpl<_$_SelectOption>(this, _$identity);
}

abstract class _SelectOption implements SelectOption {
  const factory _SelectOption(
      {required final String id,
      required final String name,
      required final Color? color}) = _$_SelectOption;

  @override
  String get id;
  @override
  String get name;
  @override
  Color? get color;
  @override
  @JsonKey(ignore: true)
  _$$_SelectOptionCopyWith<_$_SelectOption> get copyWith =>
      throw _privateConstructorUsedError;
}
