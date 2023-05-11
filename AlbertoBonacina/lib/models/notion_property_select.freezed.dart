// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_property_select.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPropertySelect _$NotionPropertySelectFromJson(Map<String, dynamic> json) {
  return _NotionPropertySelect.fromJson(json);
}

/// @nodoc
mixin _$NotionPropertySelect {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPropertySelectCopyWith<NotionPropertySelect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPropertySelectCopyWith<$Res> {
  factory $NotionPropertySelectCopyWith(NotionPropertySelect value,
          $Res Function(NotionPropertySelect) then) =
      _$NotionPropertySelectCopyWithImpl<$Res, NotionPropertySelect>;
  @useResult
  $Res call({String id, String name, String color});
}

/// @nodoc
class _$NotionPropertySelectCopyWithImpl<$Res,
        $Val extends NotionPropertySelect>
    implements $NotionPropertySelectCopyWith<$Res> {
  _$NotionPropertySelectCopyWithImpl(this._value, this._then);

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
abstract class _$$_NotionPropertySelectCopyWith<$Res>
    implements $NotionPropertySelectCopyWith<$Res> {
  factory _$$_NotionPropertySelectCopyWith(_$_NotionPropertySelect value,
          $Res Function(_$_NotionPropertySelect) then) =
      __$$_NotionPropertySelectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String color});
}

/// @nodoc
class __$$_NotionPropertySelectCopyWithImpl<$Res>
    extends _$NotionPropertySelectCopyWithImpl<$Res, _$_NotionPropertySelect>
    implements _$$_NotionPropertySelectCopyWith<$Res> {
  __$$_NotionPropertySelectCopyWithImpl(_$_NotionPropertySelect _value,
      $Res Function(_$_NotionPropertySelect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$_NotionPropertySelect(
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
class _$_NotionPropertySelect implements _NotionPropertySelect {
  const _$_NotionPropertySelect(
      {required this.id, required this.name, required this.color});

  factory _$_NotionPropertySelect.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPropertySelectFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String color;

  @override
  String toString() {
    return 'NotionPropertySelect(id: $id, name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotionPropertySelect &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPropertySelectCopyWith<_$_NotionPropertySelect> get copyWith =>
      __$$_NotionPropertySelectCopyWithImpl<_$_NotionPropertySelect>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPropertySelectToJson(
      this,
    );
  }
}

abstract class _NotionPropertySelect implements NotionPropertySelect {
  const factory _NotionPropertySelect(
      {required final String id,
      required final String name,
      required final String color}) = _$_NotionPropertySelect;

  factory _NotionPropertySelect.fromJson(Map<String, dynamic> json) =
      _$_NotionPropertySelect.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPropertySelectCopyWith<_$_NotionPropertySelect> get copyWith =>
      throw _privateConstructorUsedError;
}
