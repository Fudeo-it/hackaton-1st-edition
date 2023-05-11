// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_db_freelance_job_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionDbFreelanceJobOffer _$NotionDbFreelanceJobOfferFromJson(
    Map<String, dynamic> json) {
  return _NotionDbFreelanceJobOffer.fromJson(json);
}

/// @nodoc
mixin _$NotionDbFreelanceJobOffer {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_time')
  DateTime get createdTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_edited_time')
  DateTime get lastEditedTime => throw _privateConstructorUsedError;
  NotionDbFreelanceJobOfferProperties get properties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionDbFreelanceJobOfferCopyWith<NotionDbFreelanceJobOffer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionDbFreelanceJobOfferCopyWith<$Res> {
  factory $NotionDbFreelanceJobOfferCopyWith(NotionDbFreelanceJobOffer value,
          $Res Function(NotionDbFreelanceJobOffer) then) =
      _$NotionDbFreelanceJobOfferCopyWithImpl<$Res, NotionDbFreelanceJobOffer>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_time') DateTime createdTime,
      @JsonKey(name: 'last_edited_time') DateTime lastEditedTime,
      NotionDbFreelanceJobOfferProperties properties});

  $NotionDbFreelanceJobOfferPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$NotionDbFreelanceJobOfferCopyWithImpl<$Res,
        $Val extends NotionDbFreelanceJobOffer>
    implements $NotionDbFreelanceJobOfferCopyWith<$Res> {
  _$NotionDbFreelanceJobOfferCopyWithImpl(this._value, this._then);

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
              as NotionDbFreelanceJobOfferProperties,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionDbFreelanceJobOfferPropertiesCopyWith<$Res> get properties {
    return $NotionDbFreelanceJobOfferPropertiesCopyWith<$Res>(_value.properties,
        (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionDbFreelanceJobOfferCopyWith<$Res>
    implements $NotionDbFreelanceJobOfferCopyWith<$Res> {
  factory _$$_NotionDbFreelanceJobOfferCopyWith(
          _$_NotionDbFreelanceJobOffer value,
          $Res Function(_$_NotionDbFreelanceJobOffer) then) =
      __$$_NotionDbFreelanceJobOfferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_time') DateTime createdTime,
      @JsonKey(name: 'last_edited_time') DateTime lastEditedTime,
      NotionDbFreelanceJobOfferProperties properties});

  @override
  $NotionDbFreelanceJobOfferPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$_NotionDbFreelanceJobOfferCopyWithImpl<$Res>
    extends _$NotionDbFreelanceJobOfferCopyWithImpl<$Res,
        _$_NotionDbFreelanceJobOffer>
    implements _$$_NotionDbFreelanceJobOfferCopyWith<$Res> {
  __$$_NotionDbFreelanceJobOfferCopyWithImpl(
      _$_NotionDbFreelanceJobOffer _value,
      $Res Function(_$_NotionDbFreelanceJobOffer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdTime = null,
    Object? lastEditedTime = null,
    Object? properties = null,
  }) {
    return _then(_$_NotionDbFreelanceJobOffer(
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
              as NotionDbFreelanceJobOfferProperties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionDbFreelanceJobOffer implements _NotionDbFreelanceJobOffer {
  const _$_NotionDbFreelanceJobOffer(
      {required this.id,
      @JsonKey(name: 'created_time') required this.createdTime,
      @JsonKey(name: 'last_edited_time') required this.lastEditedTime,
      required this.properties});

  factory _$_NotionDbFreelanceJobOffer.fromJson(Map<String, dynamic> json) =>
      _$$_NotionDbFreelanceJobOfferFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_time')
  final DateTime createdTime;
  @override
  @JsonKey(name: 'last_edited_time')
  final DateTime lastEditedTime;
  @override
  final NotionDbFreelanceJobOfferProperties properties;

  @override
  String toString() {
    return 'NotionDbFreelanceJobOffer(id: $id, createdTime: $createdTime, lastEditedTime: $lastEditedTime, properties: $properties)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionDbFreelanceJobOfferCopyWith<_$_NotionDbFreelanceJobOffer>
      get copyWith => __$$_NotionDbFreelanceJobOfferCopyWithImpl<
          _$_NotionDbFreelanceJobOffer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionDbFreelanceJobOfferToJson(
      this,
    );
  }
}

abstract class _NotionDbFreelanceJobOffer implements NotionDbFreelanceJobOffer {
  const factory _NotionDbFreelanceJobOffer(
      {required final String id,
      @JsonKey(name: 'created_time') required final DateTime createdTime,
      @JsonKey(name: 'last_edited_time') required final DateTime lastEditedTime,
      required final NotionDbFreelanceJobOfferProperties
          properties}) = _$_NotionDbFreelanceJobOffer;

  factory _NotionDbFreelanceJobOffer.fromJson(Map<String, dynamic> json) =
      _$_NotionDbFreelanceJobOffer.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_time')
  DateTime get createdTime;
  @override
  @JsonKey(name: 'last_edited_time')
  DateTime get lastEditedTime;
  @override
  NotionDbFreelanceJobOfferProperties get properties;
  @override
  @JsonKey(ignore: true)
  _$$_NotionDbFreelanceJobOfferCopyWith<_$_NotionDbFreelanceJobOffer>
      get copyWith => throw _privateConstructorUsedError;
}
