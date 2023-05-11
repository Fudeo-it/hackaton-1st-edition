// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionPage _$NotionPageFromJson(
  Map<String, dynamic> json,
) {
  return _NotionPage.fromJson(
    json,
  );
}

/// @nodoc
mixin _$NotionPage {
  String get object => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created_time")
  String get createdTime => throw _privateConstructorUsedError;
  @JsonKey(name: "last_edited_time")
  String get lastEditedTime =>
      throw _privateConstructorUsedError; //TODO cover, icon, parent, archived
  Map<String, NotionPageProperty>? get properties =>
      throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionPageCopyWith<NotionPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionPageCopyWith<$Res> {
  factory $NotionPageCopyWith(
          NotionPage value, $Res Function(NotionPage) then) =
      _$NotionPageCopyWithImpl<$Res, NotionPage>;
  @useResult
  $Res call(
      {String object,
      String id,
      @JsonKey(name: "created_time") String createdTime,
      @JsonKey(name: "last_edited_time") String lastEditedTime,
      Map<String, NotionPageProperty>? properties,
      String? url});
}

/// @nodoc
class _$NotionPageCopyWithImpl<$Res, $Val extends NotionPage>
    implements $NotionPageCopyWith<$Res> {
  _$NotionPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? id = null,
    Object? createdTime = null,
    Object? lastEditedTime = null,
    Object? properties = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastEditedTime: null == lastEditedTime
          ? _value.lastEditedTime
          : lastEditedTime // ignore: cast_nullable_to_non_nullable
              as String,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, NotionPageProperty>?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionPageCopyWith<$Res>
    implements $NotionPageCopyWith<$Res> {
  factory _$$_NotionPageCopyWith(
          _$_NotionPage value, $Res Function(_$_NotionPage) then) =
      __$$_NotionPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String object,
      String id,
      @JsonKey(name: "created_time") String createdTime,
      @JsonKey(name: "last_edited_time") String lastEditedTime,
      Map<String, NotionPageProperty>? properties,
      String? url});
}

/// @nodoc
class __$$_NotionPageCopyWithImpl<$Res>
    extends _$NotionPageCopyWithImpl<$Res, _$_NotionPage>
    implements _$$_NotionPageCopyWith<$Res> {
  __$$_NotionPageCopyWithImpl(
      _$_NotionPage _value, $Res Function(_$_NotionPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? id = null,
    Object? createdTime = null,
    Object? lastEditedTime = null,
    Object? properties = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_NotionPage(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastEditedTime: null == lastEditedTime
          ? _value.lastEditedTime
          : lastEditedTime // ignore: cast_nullable_to_non_nullable
              as String,
      properties: freezed == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Map<String, NotionPageProperty>?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionPage implements _NotionPage {
  const _$_NotionPage(
      {required this.object,
      required this.id,
      @JsonKey(name: "created_time") required this.createdTime,
      @JsonKey(name: "last_edited_time") required this.lastEditedTime,
      final Map<String, NotionPageProperty>? properties,
      this.url})
      : _properties = properties;

  factory _$_NotionPage.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$$_NotionPageFromJson(
        json,
      );

  @override
  final String object;
  @override
  final String id;
  @override
  @JsonKey(name: "created_time")
  final String createdTime;
  @override
  @JsonKey(name: "last_edited_time")
  final String lastEditedTime;
//TODO cover, icon, parent, archived
  final Map<String, NotionPageProperty>? _properties;
//TODO cover, icon, parent, archived
  @override
  Map<String, NotionPageProperty>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableMapView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? url;

  @override
  String toString() {
    return 'NotionPage(object: $object, id: $id, createdTime: $createdTime, lastEditedTime: $lastEditedTime, properties: $properties, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotionPage &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.lastEditedTime, lastEditedTime) ||
                other.lastEditedTime == lastEditedTime) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, object, id, createdTime,
      lastEditedTime, const DeepCollectionEquality().hash(_properties), url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionPageCopyWith<_$_NotionPage> get copyWith =>
      __$$_NotionPageCopyWithImpl<_$_NotionPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionPageToJson(
      this,
    );
  }
}

abstract class _NotionPage implements NotionPage {
  const factory _NotionPage(
      {required final String object,
      required final String id,
      @JsonKey(name: "created_time") required final String createdTime,
      @JsonKey(name: "last_edited_time") required final String lastEditedTime,
      final Map<String, NotionPageProperty>? properties,
      final String? url}) = _$_NotionPage;

  factory _NotionPage.fromJson(
    Map<String, dynamic> json,
  ) = _$_NotionPage.fromJson;

  @override
  String get object;
  @override
  String get id;
  @override
  @JsonKey(name: "created_time")
  String get createdTime;
  @override
  @JsonKey(name: "last_edited_time")
  String get lastEditedTime;
  @override //TODO cover, icon, parent, archived
  Map<String, NotionPageProperty>? get properties;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_NotionPageCopyWith<_$_NotionPage> get copyWith =>
      throw _privateConstructorUsedError;
}
