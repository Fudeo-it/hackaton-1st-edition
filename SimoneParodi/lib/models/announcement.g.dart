// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnnouncementCWProxy {
  Announcement id(String id);

  Announcement name(String name);

  Announcement companyName(String companyName);

  Announcement webSiteUrl(String? webSiteUrl);

  Announcement qualification(String? qualification);

  Announcement seniority(Seniority? seniority);

  Announcement team(Team? team);

  Announcement contract(Contract? contract);

  Announcement salary(String? salary);

  Announcement ral(String? ral);

  Announcement desription(List<FormattedText> desription);

  Announcement howToApply(FormattedText howToApply);

  Announcement postedOn(DateTime postedOn);

  Announcement location(String? location);

  Announcement url(String url);

  Announcement favorite(bool favorite);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Announcement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Announcement(...).copyWith(id: 12, name: "My name")
  /// ````
  Announcement call({
    String? id,
    String? name,
    String? companyName,
    String? webSiteUrl,
    String? qualification,
    Seniority? seniority,
    Team? team,
    Contract? contract,
    String? salary,
    String? ral,
    List<FormattedText>? desription,
    FormattedText? howToApply,
    DateTime? postedOn,
    String? location,
    String? url,
    bool? favorite,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnnouncement.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnnouncement.copyWith.fieldName(...)`
class _$AnnouncementCWProxyImpl implements _$AnnouncementCWProxy {
  const _$AnnouncementCWProxyImpl(this._value);

  final Announcement _value;

  @override
  Announcement id(String id) => this(id: id);

  @override
  Announcement name(String name) => this(name: name);

  @override
  Announcement companyName(String companyName) =>
      this(companyName: companyName);

  @override
  Announcement webSiteUrl(String? webSiteUrl) => this(webSiteUrl: webSiteUrl);

  @override
  Announcement qualification(String? qualification) =>
      this(qualification: qualification);

  @override
  Announcement seniority(Seniority? seniority) => this(seniority: seniority);

  @override
  Announcement team(Team? team) => this(team: team);

  @override
  Announcement contract(Contract? contract) => this(contract: contract);

  @override
  Announcement salary(String? salary) => this(salary: salary);

  @override
  Announcement ral(String? ral) => this(ral: ral);

  @override
  Announcement desription(List<FormattedText> desription) =>
      this(desription: desription);

  @override
  Announcement howToApply(FormattedText howToApply) =>
      this(howToApply: howToApply);

  @override
  Announcement postedOn(DateTime postedOn) => this(postedOn: postedOn);

  @override
  Announcement location(String? location) => this(location: location);

  @override
  Announcement url(String url) => this(url: url);

  @override
  Announcement favorite(bool favorite) => this(favorite: favorite);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Announcement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Announcement(...).copyWith(id: 12, name: "My name")
  /// ````
  Announcement call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? companyName = const $CopyWithPlaceholder(),
    Object? webSiteUrl = const $CopyWithPlaceholder(),
    Object? qualification = const $CopyWithPlaceholder(),
    Object? seniority = const $CopyWithPlaceholder(),
    Object? team = const $CopyWithPlaceholder(),
    Object? contract = const $CopyWithPlaceholder(),
    Object? salary = const $CopyWithPlaceholder(),
    Object? ral = const $CopyWithPlaceholder(),
    Object? desription = const $CopyWithPlaceholder(),
    Object? howToApply = const $CopyWithPlaceholder(),
    Object? postedOn = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? favorite = const $CopyWithPlaceholder(),
  }) {
    return Announcement(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      companyName:
          companyName == const $CopyWithPlaceholder() || companyName == null
              ? _value.companyName
              // ignore: cast_nullable_to_non_nullable
              : companyName as String,
      webSiteUrl: webSiteUrl == const $CopyWithPlaceholder()
          ? _value.webSiteUrl
          // ignore: cast_nullable_to_non_nullable
          : webSiteUrl as String?,
      qualification: qualification == const $CopyWithPlaceholder()
          ? _value.qualification
          // ignore: cast_nullable_to_non_nullable
          : qualification as String?,
      seniority: seniority == const $CopyWithPlaceholder()
          ? _value.seniority
          // ignore: cast_nullable_to_non_nullable
          : seniority as Seniority?,
      team: team == const $CopyWithPlaceholder()
          ? _value.team
          // ignore: cast_nullable_to_non_nullable
          : team as Team?,
      contract: contract == const $CopyWithPlaceholder()
          ? _value.contract
          // ignore: cast_nullable_to_non_nullable
          : contract as Contract?,
      salary: salary == const $CopyWithPlaceholder()
          ? _value.salary
          // ignore: cast_nullable_to_non_nullable
          : salary as String?,
      ral: ral == const $CopyWithPlaceholder()
          ? _value.ral
          // ignore: cast_nullable_to_non_nullable
          : ral as String?,
      desription:
          desription == const $CopyWithPlaceholder() || desription == null
              ? _value.desription
              // ignore: cast_nullable_to_non_nullable
              : desription as List<FormattedText>,
      howToApply:
          howToApply == const $CopyWithPlaceholder() || howToApply == null
              ? _value.howToApply
              // ignore: cast_nullable_to_non_nullable
              : howToApply as FormattedText,
      postedOn: postedOn == const $CopyWithPlaceholder() || postedOn == null
          ? _value.postedOn
          // ignore: cast_nullable_to_non_nullable
          : postedOn as DateTime,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      favorite: favorite == const $CopyWithPlaceholder() || favorite == null
          ? _value.favorite
          // ignore: cast_nullable_to_non_nullable
          : favorite as bool,
    );
  }
}

extension $AnnouncementCopyWith on Announcement {
  /// Returns a callable class that can be used as follows: `instanceOfAnnouncement.copyWith(...)` or like so:`instanceOfAnnouncement.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnnouncementCWProxy get copyWith => _$AnnouncementCWProxyImpl(this);
}
