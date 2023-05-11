// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_db_hiring_job_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionDbHiringJobOffer _$NotionDbHiringJobOfferFromJson(
    Map<String, dynamic> json) {
  return _NotionDbHiringJobOffer.fromJson(json);
}

/// @nodoc
mixin _$NotionDbHiringJobOffer {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_time')
  DateTime get createdTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_edited_time')
  DateTime get lastEditedTime => throw _privateConstructorUsedError;
  NotionDbHiringJobOfferProperties get properties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionDbHiringJobOfferCopyWith<NotionDbHiringJobOffer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionDbHiringJobOfferCopyWith<$Res> {
  factory $NotionDbHiringJobOfferCopyWith(NotionDbHiringJobOffer value,
          $Res Function(NotionDbHiringJobOffer) then) =
      _$NotionDbHiringJobOfferCopyWithImpl<$Res, NotionDbHiringJobOffer>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_time') DateTime createdTime,
      @JsonKey(name: 'last_edited_time') DateTime lastEditedTime,
      NotionDbHiringJobOfferProperties properties});

  $NotionDbHiringJobOfferPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$NotionDbHiringJobOfferCopyWithImpl<$Res,
        $Val extends NotionDbHiringJobOffer>
    implements $NotionDbHiringJobOfferCopyWith<$Res> {
  _$NotionDbHiringJobOfferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdTime = null,
    Object? lastEditedTime = null,
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEditedTime: null == lastEditedTime
          ? _value.lastEditedTime
          : lastEditedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as NotionDbHiringJobOfferProperties,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionDbHiringJobOfferPropertiesCopyWith<$Res> get properties {
    return $NotionDbHiringJobOfferPropertiesCopyWith<$Res>(_value.properties,
        (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionDbHiringJobOfferCopyWith<$Res>
    implements $NotionDbHiringJobOfferCopyWith<$Res> {
  factory _$$_NotionDbHiringJobOfferCopyWith(_$_NotionDbHiringJobOffer value,
          $Res Function(_$_NotionDbHiringJobOffer) then) =
      __$$_NotionDbHiringJobOfferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_time') DateTime createdTime,
      @JsonKey(name: 'last_edited_time') DateTime lastEditedTime,
      NotionDbHiringJobOfferProperties properties});

  @override
  $NotionDbHiringJobOfferPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$_NotionDbHiringJobOfferCopyWithImpl<$Res>
    extends _$NotionDbHiringJobOfferCopyWithImpl<$Res,
        _$_NotionDbHiringJobOffer>
    implements _$$_NotionDbHiringJobOfferCopyWith<$Res> {
  __$$_NotionDbHiringJobOfferCopyWithImpl(_$_NotionDbHiringJobOffer _value,
      $Res Function(_$_NotionDbHiringJobOffer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdTime = null,
    Object? lastEditedTime = null,
    Object? properties = null,
  }) {
    return _then(_$_NotionDbHiringJobOffer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEditedTime: null == lastEditedTime
          ? _value.lastEditedTime
          : lastEditedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as NotionDbHiringJobOfferProperties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionDbHiringJobOffer implements _NotionDbHiringJobOffer {
  const _$_NotionDbHiringJobOffer(
      {required this.id,
      @JsonKey(name: 'created_time') required this.createdTime,
      @JsonKey(name: 'last_edited_time') required this.lastEditedTime,
      required this.properties});

  factory _$_NotionDbHiringJobOffer.fromJson(Map<String, dynamic> json) =>
      _$$_NotionDbHiringJobOfferFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_time')
  final DateTime createdTime;
  @override
  @JsonKey(name: 'last_edited_time')
  final DateTime lastEditedTime;
  @override
  final NotionDbHiringJobOfferProperties properties;

  @override
  String toString() {
    return 'NotionDbHiringJobOffer(id: $id, createdTime: $createdTime, lastEditedTime: $lastEditedTime, properties: $properties)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionDbHiringJobOfferCopyWith<_$_NotionDbHiringJobOffer> get copyWith =>
      __$$_NotionDbHiringJobOfferCopyWithImpl<_$_NotionDbHiringJobOffer>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionDbHiringJobOfferToJson(
      this,
    );
  }
}

abstract class _NotionDbHiringJobOffer implements NotionDbHiringJobOffer {
  const factory _NotionDbHiringJobOffer(
      {required final String id,
      @JsonKey(name: 'created_time') required final DateTime createdTime,
      @JsonKey(name: 'last_edited_time') required final DateTime lastEditedTime,
      required final NotionDbHiringJobOfferProperties
          properties}) = _$_NotionDbHiringJobOffer;

  factory _NotionDbHiringJobOffer.fromJson(Map<String, dynamic> json) =
      _$_NotionDbHiringJobOffer.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_time')
  DateTime get createdTime;
  @override
  @JsonKey(name: 'last_edited_time')
  DateTime get lastEditedTime;
  @override
  NotionDbHiringJobOfferProperties get properties;
  @override
  @JsonKey(ignore: true)
  _$$_NotionDbHiringJobOfferCopyWith<_$_NotionDbHiringJobOffer> get copyWith =>
      throw _privateConstructorUsedError;
}
