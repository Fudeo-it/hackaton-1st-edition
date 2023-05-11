// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_db_property_select.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionDbPropertySelect _$NotionDbPropertySelectFromJson(
    Map<String, dynamic> json) {
  return _NotionDbPropertySelect.fromJson(json);
}

/// @nodoc
mixin _$NotionDbPropertySelect {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  NotionDbPropertySelectOptions get select =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionDbPropertySelectCopyWith<NotionDbPropertySelect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionDbPropertySelectCopyWith<$Res> {
  factory $NotionDbPropertySelectCopyWith(NotionDbPropertySelect value,
          $Res Function(NotionDbPropertySelect) then) =
      _$NotionDbPropertySelectCopyWithImpl<$Res, NotionDbPropertySelect>;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      NotionDbPropertySelectOptions select});

  $NotionDbPropertySelectOptionsCopyWith<$Res> get select;
}

/// @nodoc
class _$NotionDbPropertySelectCopyWithImpl<$Res,
        $Val extends NotionDbPropertySelect>
    implements $NotionDbPropertySelectCopyWith<$Res> {
  _$NotionDbPropertySelectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? select = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      select: null == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelectOptions,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionDbPropertySelectOptionsCopyWith<$Res> get select {
    return $NotionDbPropertySelectOptionsCopyWith<$Res>(_value.select, (value) {
      return _then(_value.copyWith(select: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionDbPropertySelectCopyWith<$Res>
    implements $NotionDbPropertySelectCopyWith<$Res> {
  factory _$$_NotionDbPropertySelectCopyWith(_$_NotionDbPropertySelect value,
          $Res Function(_$_NotionDbPropertySelect) then) =
      __$$_NotionDbPropertySelectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      NotionDbPropertySelectOptions select});

  @override
  $NotionDbPropertySelectOptionsCopyWith<$Res> get select;
}

/// @nodoc
class __$$_NotionDbPropertySelectCopyWithImpl<$Res>
    extends _$NotionDbPropertySelectCopyWithImpl<$Res,
        _$_NotionDbPropertySelect>
    implements _$$_NotionDbPropertySelectCopyWith<$Res> {
  __$$_NotionDbPropertySelectCopyWithImpl(_$_NotionDbPropertySelect _value,
      $Res Function(_$_NotionDbPropertySelect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? select = null,
  }) {
    return _then(_$_NotionDbPropertySelect(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      select: null == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as NotionDbPropertySelectOptions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionDbPropertySelect implements _NotionDbPropertySelect {
  const _$_NotionDbPropertySelect(
      {required this.id,
      required this.name,
      required this.type,
      required this.select});

  factory _$_NotionDbPropertySelect.fromJson(Map<String, dynamic> json) =>
      _$$_NotionDbPropertySelectFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final NotionDbPropertySelectOptions select;

  @override
  String toString() {
    return 'NotionDbPropertySelect(id: $id, name: $name, type: $type, select: $select)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionDbPropertySelectCopyWith<_$_NotionDbPropertySelect> get copyWith =>
      __$$_NotionDbPropertySelectCopyWithImpl<_$_NotionDbPropertySelect>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionDbPropertySelectToJson(
      this,
    );
  }
}

abstract class _NotionDbPropertySelect
    implements NotionDbPropertySelect, NotionDbProperty {
  const factory _NotionDbPropertySelect(
          {required final String id,
          required final String name,
          required final String type,
          required final NotionDbPropertySelectOptions select}) =
      _$_NotionDbPropertySelect;

  factory _NotionDbPropertySelect.fromJson(Map<String, dynamic> json) =
      _$_NotionDbPropertySelect.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  NotionDbPropertySelectOptions get select;
  @override
  @JsonKey(ignore: true)
  _$$_NotionDbPropertySelectCopyWith<_$_NotionDbPropertySelect> get copyWith =>
      throw _privateConstructorUsedError;
}
