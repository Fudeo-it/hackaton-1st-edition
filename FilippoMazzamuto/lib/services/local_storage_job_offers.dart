import 'dart:convert';

import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageJobOffers {
  final SharedPreferences _plugin;

  LocalStorageJobOffers({
    required final SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  static const kJobOffersCollectionKey = '__job_offers_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);

  Future<void>_setValue(String key, String value) => 
    _plugin.setString(key, value);

  Future<bool> _removeValue(String key) => _plugin.remove(key);

  void _init() async {
    final jobOffersJson = _getValue(kJobOffersCollectionKey);
    if (jobOffersJson != null) {
      //print(json.decode(jobOffersJson));
    }
  }

  Future<void> saveJobOffer(JobOffer jobOffer) async {
    final jobOffersJson = _getValue(kJobOffersCollectionKey);
    List<JobOffer> jobOffers = [jobOffer];
    if (jobOffersJson != null) {
      jobOffers = List<Map<dynamic, dynamic>>.from(
        json.decode(jobOffersJson) as List,
      )
        .map((jsonMap) {
          final target = TargetJobOffer.values.byName(jsonMap['target']);
          switch(target) {
            case TargetJobOffer.recruitment: 
              return Recruitment.fromJson(Map<String, dynamic>.from(jsonMap));
            case TargetJobOffer.freelance:
              return Freelance.fromJson(Map<String, dynamic>.from(jsonMap));
          }
        } )
        .toList();
      int index = jobOffers.indexWhere((item) => item.id == jobOffer.id);
      if (index > -1) {
        jobOffers.removeAt(index);
      } else {
        jobOffers.add(jobOffer);
      }
    }
    return await _setValue(kJobOffersCollectionKey, json.encode(jobOffers));
  }

  Future<void> clearJobOffers() async {
    return await _setValue(kJobOffersCollectionKey, json.encode([]));
  }

  List<JobOffer>? getJobOffers() {
    final jobOffersJson = _getValue(kJobOffersCollectionKey);
    if (jobOffersJson != null) {
      return List<Map<dynamic, dynamic>>.from(
        json.decode(jobOffersJson) as List,
      )
        .map((jsonMap) {
          final TargetJobOffer target = TargetJobOffer.values.byName(jsonMap['target']);
          switch(target) {
            case TargetJobOffer.recruitment:
              return Recruitment.fromJson(Map<String, dynamic>.from(jsonMap));
            case TargetJobOffer.freelance:
              return Freelance.fromJson(Map<String, dynamic>.from(jsonMap));
          }
        } )
        .toList();
    }
    return null;
  }

}