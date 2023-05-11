// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_page_freelance_job_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPageFreelanceJobOffer _$NotionPageFreelanceJobOfferFromJson(
    Map<String, dynamic> json) {
  return _NotionPageFreelanceJobOffer.fromJson(json);
}

/// @nodoc
mixin _$NotionPageFreelanceJobOffer {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_time')
  DateTime get createdTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_edited_time')
  DateTime get lastEditedTime => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  NotionIcon? get icon => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  NotionPageFreelanceJobOfferProperties get properties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPageFreelanceJobOfferCopyWith<NotionPageFreelanceJobOffer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPageFreelanceJobOfferCopyWith<$Res> {
  factory $NotionPageFreelanceJobOfferCopyWith(
          NotionPageFreelanceJobOffer value,
          $Res Function(NotionPageFreelanceJobOffer) then) =
      _$NotionPageFreelanceJobOfferCopyWithImpl<$Res,
          NotionPageFreelanceJobOffer>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_time') DateTime createdTime,
      @JsonKey(name: 'last_edited_time') DateTime lastEditedTime,
      bool archived,
      NotionIcon? icon,
      String url,
      NotionPageFreelanceJobOfferProperties properties});

  $NotionIconCopyWith<$Res>? get icon;
  $NotionPageFreelanceJobOfferPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$NotionPageFreelanceJobOfferCopyWithImpl<$Res,
        $Val extends NotionPageFreelanceJobOffer>
    implements $NotionPageFreelanceJobOfferCopyWith<$Res> {
  _$NotionPageFreelanceJobOfferCopyWithImpl(this._value, this._then);

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
    Object? archived = null,
    Object? icon = freezed,
    Object? url = null,
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
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as NotionIcon?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as NotionPageFreelanceJobOfferProperties,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionIconCopyWith<$Res>? get icon {
    if (_value.icon == null) {
      return null;
    }

    return $NotionIconCopyWith<$Res>(_value.icon!, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotionPageFreelanceJobOfferPropertiesCopyWith<$Res> get properties {
    return $NotionPageFreelanceJobOfferPropertiesCopyWith<$Res>(
        _value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionPageFreelanceJobOfferCopyWith<$Res>
    implements $NotionPageFreelanceJobOfferCopyWith<$Res> {
  factory _$$_NotionPageFreelanceJobOfferCopyWith(
          _$_NotionPageFreelanceJobOffer value,
          $Res Function(_$_NotionPageFreelanceJobOffer) then) =
      __$$_NotionPageFreelanceJobOfferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_time') DateTime createdTime,
      @JsonKey(name: 'last_edited_time') DateTime lastEditedTime,
      bool archived,
      NotionIcon? icon,
      String url,
      NotionPageFreelanceJobOfferProperties properties});

  @override
  $NotionIconCopyWith<$Res>? get icon;
  @override
  $NotionPageFreelanceJobOfferPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$_NotionPageFreelanceJobOfferCopyWithImpl<$Res>
    extends _$NotionPageFreelanceJobOfferCopyWithImpl<$Res,
        _$_NotionPageFreelanceJobOffer>
    implements _$$_NotionPageFreelanceJobOfferCopyWith<$Res> {
  __$$_NotionPageFreelanceJobOfferCopyWithImpl(
      _$_NotionPageFreelanceJobOffer _value,
      $Res Function(_$_NotionPageFreelanceJobOffer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdTime = null,
    Object? lastEditedTime = null,
    Object? archived = null,
    Object? icon = freezed,
    Object? url = null,
    Object? properties = null,
  }) {
    return _then(_$_NotionPageFreelanceJobOffer(
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
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as NotionIcon?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as NotionPageFreelanceJobOfferProperties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPageFreelanceJobOffer implements _NotionPageFreelanceJobOffer {
  const _$_NotionPageFreelanceJobOffer(
      {required this.id,
      @JsonKey(name: 'created_time') required this.createdTime,
      @JsonKey(name: 'last_edited_time') required this.lastEditedTime,
      required this.archived,
      this.icon,
      required this.url,
      required this.properties});

  factory _$_NotionPageFreelanceJobOffer.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPageFreelanceJobOfferFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_time')
  final DateTime createdTime;
  @override
  @JsonKey(name: 'last_edited_time')
  final DateTime lastEditedTime;
  @override
  final bool archived;
  @override
  final NotionIcon? icon;
  @override
  final String url;
  @override
  final NotionPageFreelanceJobOfferProperties properties;

  @override
  String toString() {
    return 'NotionPageFreelanceJobOffer(id: $id, createdTime: $createdTime, lastEditedTime: $lastEditedTime, archived: $archived, icon: $icon, url: $url, properties: $properties)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPageFreelanceJobOfferCopyWith<_$_NotionPageFreelanceJobOffer>
      get copyWith => __$$_NotionPageFreelanceJobOfferCopyWithImpl<
          _$_NotionPageFreelanceJobOffer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPageFreelanceJobOfferToJson(
      this,
    );
  }
}

abstract class _NotionPageFreelanceJobOffer
    implements NotionPageFreelanceJobOffer {
  const factory _NotionPageFreelanceJobOffer(
      {required final String id,
      @JsonKey(name: 'created_time') required final DateTime createdTime,
      @JsonKey(name: 'last_edited_time') required final DateTime lastEditedTime,
      required final bool archived,
      final NotionIcon? icon,
      required final String url,
      required final NotionPageFreelanceJobOfferProperties
          properties}) = _$_NotionPageFreelanceJobOffer;

  factory _NotionPageFreelanceJobOffer.fromJson(Map<String, dynamic> json) =
      _$_NotionPageFreelanceJobOffer.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_time')
  DateTime get createdTime;
  @override
  @JsonKey(name: 'last_edited_time')
  DateTime get lastEditedTime;
  @override
  bool get archived;
  @override
  NotionIcon? get icon;
  @override
  String get url;
  @override
  NotionPageFreelanceJobOfferProperties get properties;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPageFreelanceJobOfferCopyWith<_$_NotionPageFreelanceJobOffer>
      get copyWith => throw _privateConstructorUsedError;
}
