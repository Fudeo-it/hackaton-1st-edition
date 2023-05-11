// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_page_hiring_job_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPageHiringJobOffer _$NotionPageHiringJobOfferFromJson(
    Map<String, dynamic> json) {
  return _NotionPageHiringJobOffer.fromJson(json);
}

/// @nodoc
mixin _$NotionPageHiringJobOffer {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_time')
  DateTime get createdTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_edited_time')
  DateTime get lastEditedTime => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  NotionIcon? get icon => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  NotionPageHiringJobOfferProperties get properties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPageHiringJobOfferCopyWith<NotionPageHiringJobOffer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPageHiringJobOfferCopyWith<$Res> {
  factory $NotionPageHiringJobOfferCopyWith(NotionPageHiringJobOffer value,
          $Res Function(NotionPageHiringJobOffer) then) =
      _$NotionPageHiringJobOfferCopyWithImpl<$Res, NotionPageHiringJobOffer>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_time') DateTime createdTime,
      @JsonKey(name: 'last_edited_time') DateTime lastEditedTime,
      bool archived,
      NotionIcon? icon,
      String url,
      NotionPageHiringJobOfferProperties properties});

  $NotionIconCopyWith<$Res>? get icon;
  $NotionPageHiringJobOfferPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$NotionPageHiringJobOfferCopyWithImpl<$Res,
        $Val extends NotionPageHiringJobOffer>
    implements $NotionPageHiringJobOfferCopyWith<$Res> {
  _$NotionPageHiringJobOfferCopyWithImpl(this._value, this._then);

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
              as NotionPageHiringJobOfferProperties,
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
  $NotionPageHiringJobOfferPropertiesCopyWith<$Res> get properties {
    return $NotionPageHiringJobOfferPropertiesCopyWith<$Res>(_value.properties,
        (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotionPageHiringJobOfferCopyWith<$Res>
    implements $NotionPageHiringJobOfferCopyWith<$Res> {
  factory _$$_NotionPageHiringJobOfferCopyWith(
          _$_NotionPageHiringJobOffer value,
          $Res Function(_$_NotionPageHiringJobOffer) then) =
      __$$_NotionPageHiringJobOfferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_time') DateTime createdTime,
      @JsonKey(name: 'last_edited_time') DateTime lastEditedTime,
      bool archived,
      NotionIcon? icon,
      String url,
      NotionPageHiringJobOfferProperties properties});

  @override
  $NotionIconCopyWith<$Res>? get icon;
  @override
  $NotionPageHiringJobOfferPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$_NotionPageHiringJobOfferCopyWithImpl<$Res>
    extends _$NotionPageHiringJobOfferCopyWithImpl<$Res,
        _$_NotionPageHiringJobOffer>
    implements _$$_NotionPageHiringJobOfferCopyWith<$Res> {
  __$$_NotionPageHiringJobOfferCopyWithImpl(_$_NotionPageHiringJobOffer _value,
      $Res Function(_$_NotionPageHiringJobOffer) _then)
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
    return _then(_$_NotionPageHiringJobOffer(
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
              as NotionPageHiringJobOfferProperties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPageHiringJobOffer implements _NotionPageHiringJobOffer {
  const _$_NotionPageHiringJobOffer(
      {required this.id,
      @JsonKey(name: 'created_time') required this.createdTime,
      @JsonKey(name: 'last_edited_time') required this.lastEditedTime,
      required this.archived,
      this.icon,
      required this.url,
      required this.properties});

  factory _$_NotionPageHiringJobOffer.fromJson(Map<String, dynamic> json) =>
      _$$_NotionPageHiringJobOfferFromJson(json);

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
  final NotionPageHiringJobOfferProperties properties;

  @override
  String toString() {
    return 'NotionPageHiringJobOffer(id: $id, createdTime: $createdTime, lastEditedTime: $lastEditedTime, archived: $archived, icon: $icon, url: $url, properties: $properties)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPageHiringJobOfferCopyWith<_$_NotionPageHiringJobOffer>
      get copyWith => __$$_NotionPageHiringJobOfferCopyWithImpl<
          _$_NotionPageHiringJobOffer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPageHiringJobOfferToJson(
      this,
    );
  }
}

abstract class _NotionPageHiringJobOffer implements NotionPageHiringJobOffer {
  const factory _NotionPageHiringJobOffer(
      {required final String id,
      @JsonKey(name: 'created_time') required final DateTime createdTime,
      @JsonKey(name: 'last_edited_time') required final DateTime lastEditedTime,
      required final bool archived,
      final NotionIcon? icon,
      required final String url,
      required final NotionPageHiringJobOfferProperties
          properties}) = _$_NotionPageHiringJobOffer;

  factory _NotionPageHiringJobOffer.fromJson(Map<String, dynamic> json) =
      _$_NotionPageHiringJobOffer.fromJson;

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
  NotionPageHiringJobOfferProperties get properties;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPageHiringJobOfferCopyWith<_$_NotionPageHiringJobOffer>
      get copyWith => throw _privateConstructorUsedError;
}
