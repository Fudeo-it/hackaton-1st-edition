// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_page_property_created_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPagePropertyCreatedTime _$NotionPagePropertyCreatedTimeFromJson(
    Map<String, dynamic> json) {
  return _NotionPagePropertyCreatedTime.fromJson(json);
}

/// @nodoc
mixin _$NotionPagePropertyCreatedTime {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_time')
  DateTime get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPagePropertyCreatedTimeCopyWith<NotionPagePropertyCreatedTime>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPagePropertyCreatedTimeCopyWith<$Res> {
  factory $NotionPagePropertyCreatedTimeCopyWith(
          NotionPagePropertyCreatedTime value,
          $Res Function(NotionPagePropertyCreatedTime) then) =
      _$NotionPagePropertyCreatedTimeCopyWithImpl<$Res,
          NotionPagePropertyCreatedTime>;
  @useResult
  $Res call(
      {String id,
      String type,
      @JsonKey(name: 'created_time') DateTime createdTime});
}

/// @nodoc
class _$NotionPagePropertyCreatedTimeCopyWithImpl<$Res,
        $Val extends NotionPagePropertyCreatedTime>
    implements $NotionPagePropertyCreatedTimeCopyWith<$Res> {
  _$NotionPagePropertyCreatedTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? createdTime = null,
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
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionPagePropertyCreatedTimeCopyWith<$Res>
    implements $NotionPagePropertyCreatedTimeCopyWith<$Res> {
  factory _$$_NotionPagePropertyCreatedTimeCopyWith(
          _$_NotionPagePropertyCreatedTime value,
          $Res Function(_$_NotionPagePropertyCreatedTime) then) =
      __$$_NotionPagePropertyCreatedTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      @JsonKey(name: 'created_time') DateTime createdTime});
}

/// @nodoc
class __$$_NotionPagePropertyCreatedTimeCopyWithImpl<$Res>
    extends _$NotionPagePropertyCreatedTimeCopyWithImpl<$Res,
        _$_NotionPagePropertyCreatedTime>
    implements _$$_NotionPagePropertyCreatedTimeCopyWith<$Res> {
  __$$_NotionPagePropertyCreatedTimeCopyWithImpl(
      _$_NotionPagePropertyCreatedTime _value,
      $Res Function(_$_NotionPagePropertyCreatedTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? createdTime = null,
  }) {
    return _then(_$_NotionPagePropertyCreatedTime(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPagePropertyCreatedTime
    implements _NotionPagePropertyCreatedTime {
  const _$_NotionPagePropertyCreatedTime(
      {required this.id,
      required this.type,
      @JsonKey(name: 'created_time') required this.createdTime});

  factory _$_NotionPagePropertyCreatedTime.fromJson(
          Map<String, dynamic> json) =>
      _$$_NotionPagePropertyCreatedTimeFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  @JsonKey(name: 'created_time')
  final DateTime createdTime;

  @override
  String toString() {
    return 'NotionPagePropertyCreatedTime(id: $id, type: $type, createdTime: $createdTime)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPagePropertyCreatedTimeCopyWith<_$_NotionPagePropertyCreatedTime>
      get copyWith => __$$_NotionPagePropertyCreatedTimeCopyWithImpl<
          _$_NotionPagePropertyCreatedTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPagePropertyCreatedTimeToJson(
      this,
    );
  }
}

abstract class _NotionPagePropertyCreatedTime
    implements NotionPagePropertyCreatedTime, NotionPageProperty {
  const factory _NotionPagePropertyCreatedTime(
          {required final String id,
          required final String type,
          @JsonKey(name: 'created_time') required final DateTime createdTime}) =
      _$_NotionPagePropertyCreatedTime;

  factory _NotionPagePropertyCreatedTime.fromJson(Map<String, dynamic> json) =
      _$_NotionPagePropertyCreatedTime.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  @JsonKey(name: 'created_time')
  DateTime get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPagePropertyCreatedTimeCopyWith<_$_NotionPagePropertyCreatedTime>
      get copyWith => throw _privateConstructorUsedError;
}
