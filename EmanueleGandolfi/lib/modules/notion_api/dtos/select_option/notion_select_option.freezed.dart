// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_select_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionSelectOption _$NotionSelectOptionFromJson(Map<String, dynamic> json) {
  return _NotionSelectOption.fromJson(json);
}

/// @nodoc
mixin _$NotionSelectOption {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionSelectOptionCopyWith<NotionSelectOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionSelectOptionCopyWith<$Res> {
  factory $NotionSelectOptionCopyWith(
          NotionSelectOption value, $Res Function(NotionSelectOption) then) =
      _$NotionSelectOptionCopyWithImpl<$Res, NotionSelectOption>;
  @useResult
  $Res call({String id, String name, String color});
}

/// @nodoc
class _$NotionSelectOptionCopyWithImpl<$Res, $Val extends NotionSelectOption>
    implements $NotionSelectOptionCopyWith<$Res> {
  _$NotionSelectOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
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
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionSelectOptionCopyWith<$Res>
    implements $NotionSelectOptionCopyWith<$Res> {
  factory _$$_NotionSelectOptionCopyWith(_$_NotionSelectOption value,
          $Res Function(_$_NotionSelectOption) then) =
      __$$_NotionSelectOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String color});
}

/// @nodoc
class __$$_NotionSelectOptionCopyWithImpl<$Res>
    extends _$NotionSelectOptionCopyWithImpl<$Res, _$_NotionSelectOption>
    implements _$$_NotionSelectOptionCopyWith<$Res> {
  __$$_NotionSelectOptionCopyWithImpl(
      _$_NotionSelectOption _value, $Res Function(_$_NotionSelectOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$_NotionSelectOption(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionSelectOption implements _NotionSelectOption {
  const _$_NotionSelectOption(
      {required this.id, required this.name, required this.color});

  factory _$_NotionSelectOption.fromJson(Map<String, dynamic> json) =>
      _$$_NotionSelectOptionFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String color;

  @override
  String toString() {
    return 'NotionSelectOption(id: $id, name: $name, color: $color)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionSelectOptionCopyWith<_$_NotionSelectOption> get copyWith =>
      __$$_NotionSelectOptionCopyWithImpl<_$_NotionSelectOption>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionSelectOptionToJson(
      this,
    );
  }
}

abstract class _NotionSelectOption implements NotionSelectOption {
  const factory _NotionSelectOption(
      {required final String id,
      required final String name,
      required final String color}) = _$_NotionSelectOption;

  factory _NotionSelectOption.fromJson(Map<String, dynamic> json) =
      _$_NotionSelectOption.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$_NotionSelectOptionCopyWith<_$_NotionSelectOption> get copyWith =>
      throw _privateConstructorUsedError;
}
