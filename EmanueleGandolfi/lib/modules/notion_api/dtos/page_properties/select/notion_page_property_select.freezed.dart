// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_page_property_select.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPagePropertySelect _$NotionPagePropertySelectFromJson(
    Map<String, dynamic> json) {
  return _NotionPagePropertySelect.fromJson(json);
}

/// @nodoc
mixin _$NotionPagePropertySelect {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  NotionSelectOption? get select => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPagePropertySelectCopyWith<NotionPagePropertySelect> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPagePropertySelectCopyWith<$Res> {
  factory $NotionPagePropertySelectCopyWith(NotionPagePropertySelect value,
          $Res Function(NotionPagePropertySelect) then) =
      _$NotionPagePropertySelectCopyWithImpl<$Res, NotionPagePropertySelect>;
  @useResult
  $Res call({String id, String type, NotionSelectOption? select});

  $NotionSelectOptionCopyWith<$Res>? get select;
}

/// @nodoc
class _$NotionPagePropertySelectCopyWithImpl<$Res,
        $Val extends NotionPagePropertySelect>
    implements $NotionPagePropertySelectCopyWith<$Res> {
  _$NotionPagePropertySelectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? select = freezed,
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
      select: freezed == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as NotionSelectOption?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionSelectOptionCopyWith<$Res>? get select {
    if (_value.select == null) {
      return null;
    }

    return $NotionSelectOptionCopyWith<$Res>(_value.select!, (value) {
      return _then(_value.copyWith(select: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionPagePropertySelectCopyWith<$Res>
    implements $NotionPagePropertySelectCopyWith<$Res> {
  factory _$$_NotionPagePropertySelectCopyWith(
          _$_NotionPagePropertySelect value,
          $Res Function(_$_NotionPagePropertySelect) then) =
      __$$_NotionPagePropertySelectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type, NotionSelectOption? select});

  @override
  $NotionSelectOptionCopyWith<$Res>? get select;
}

/// @nodoc
class __$$_NotionPagePropertySelectCopyWithImpl<$Res>
    extends _$NotionPagePropertySelectCopyWithImpl<$Res,
        _$_NotionPagePropertySelect>
    implements _$$_NotionPagePropertySelectCopyWith<$Res> {
  __$$_NotionPagePropertySelectCopyWithImpl(_$_NotionPagePropertySelect _value,
      $Res Function(_$_NotionPagePropertySelect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? select = freezed,
  }) {
    return _then(_$_NotionPagePropertySelect(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      select: freezed == select
          ? _value.select
          : select // ignore: cast_nullable_to_non_nullable
              as NotionSelectOption?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPagePropertySelect implements _NotionPagePropertySelect {
  const _$_NotionPagePropertySelect(
      {required this.id, required this.type, required this.select});

  factory _$_NotionPagePropertySelect.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPagePropertySelectFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final NotionSelectOption? select;

  @override
  String toString() {
    return 'NotionPagePropertySelect(id: $id, type: $type, select: $select)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPagePropertySelectCopyWith<_$_NotionPagePropertySelect>
      get copyWith => __$$_NotionPagePropertySelectCopyWithImpl<
          _$_NotionPagePropertySelect>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPagePropertySelectToJson(
      this,
    );
  }
}

abstract class _NotionPagePropertySelect
    implements NotionPagePropertySelect, NotionPageProperty {
  const factory _NotionPagePropertySelect(
      {required final String id,
      required final String type,
      required final NotionSelectOption? select}) = _$_NotionPagePropertySelect;

  factory _NotionPagePropertySelect.fromJson(Map<String, dynamic> json) =
      _$_NotionPagePropertySelect.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  NotionSelectOption? get select;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPagePropertySelectCopyWith<_$_NotionPagePropertySelect>
      get copyWith => throw _privateConstructorUsedError;
}
