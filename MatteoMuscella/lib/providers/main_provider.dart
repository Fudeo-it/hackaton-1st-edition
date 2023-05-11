import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jobs_search/constants.dart';
import 'package:jobs_search/models/api_models.dart';
import 'package:jobs_search/models/app_models.dart';
import 'package:jobs_search/services/notion_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider with ChangeNotifier {
  Map<String, JobOffer> jobOffers = {};
  bool loading = true;
  bool error = false;
  Set<String> favourites = {};
  int currentTabIndex = 0;
  bool devMode = false;
  // TODO: Save in shared preferences
  String locale = 'it_IT';

  /// Map that holds dbId -> Notion Property Name -> Notion Property Type
  /// Used to know which properties can be passed to query the results
  Map<String, Map<String, String>> notionProperties = {};
  String searchQuery = '';
  Map<String, dynamic> filters = {};

  Map<String, DbModel> dbs = {
    'hiring': DbModel('283d2760f81548f0a7baca4b3e58d7d8'),
    'freelance': DbModel('e6a8a6760e3d4430b20a15d16f75f92e'),
  };

  final NotionApiService _mainService;

  MainProvider(this._mainService);

  List<JobOffer> getJobOffers() => jobOffers.values.toList();

  List<JobOffer> getFavourites() =>
      jobOffers.values.where((x) => favourites.contains(x.id)).toList();

  bool hasMore() => dbs.values.fold(false, (acc, x) => acc || x.hasMore);

  /// Initialization method called at app first render
  /// Loads the favourites saved in the SharedPreferences
  /// Initializes the Date Formatting with the locale specified
  Future<void> init() async {
    debugPrint('MainProvider::init');
    var prefs = await SharedPreferences.getInstance();
    var savedFavourites = prefs.getStringList(prefsKeyFavourites) ?? [];
    favourites.addAll(savedFavourites);
    await initializeDateFormatting(locale, null);
  }

  /// Method to load job offers used when the job offers list widget is built
  /// This method is called in the initState lifecycle of the widget
  /// It checks if the jobOffers map is empty because I don't want to fetch
  /// data again if I'm only changing screen
  /// There is room for improvement in this logic
  Future<void> loadJobOffers() async {
    if (jobOffers.isEmpty) {
      fetchJobOffers();
    }
  }

  /// Main method to load job offers
  /// Cycles through the database models and for each Db Id
  /// calls the Notion API to fetch data
  Future<void> fetchJobOffers({fetchMore = false}) async {
    error = false;
    loading = true;

    var dbEntries = dbs.entries.where((e) => e.value.hasMore);

    if (!fetchMore) {
      jobOffers = {};
    }

    for (var entry in dbEntries) {
      var dbModel = entry.value;
      var dbId = dbModel.id;

      var query = NotionQuery(
        startCursor: fetchMore ? dbModel.nextCursor : null,
        properties: notionProperties[dbId] ?? {},
        searchQuery: searchQuery,
        filters: filters,
      );

      try {
        var serviceModel =
            await _mainService.fetchJobOffers(dbId, query, entry.key);

        for (var jo in serviceModel.jobOffers) {
          jobOffers.putIfAbsent(jo.id, () => jo);

          for (var k in jo.props.keys) {
            if (!notionProperties.containsKey(dbId)) {
              notionProperties.putIfAbsent(dbId, () => {});
            }
            notionProperties[dbId]?.putIfAbsent(k, () => jo.props[k]['type']);
          }

        }

        dbModel.nextCursor = serviceModel.nextCursor;
        dbModel.hasMore = serviceModel.hasMore;
      } catch (e) {
        debugPrint('Error calling API for db $dbId: ${e.toString()}');
        error = true;
      }
    }

    debugPrint('Retrieved ${notionProperties.length} properties');
    // debugPrint('Properties: $notionProperties');

    loading = false;
    notifyListeners();
  }

  void toggleLoading() {
    loading = !loading;
    notifyListeners();
  }

  void toggleFavourite(String id) async {
    if (favourites.contains(id)) {
      favourites.remove(id);
    } else {
      favourites.add(id);
    }
    notifyListeners();

    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList(prefsKeyFavourites, favourites.toList());
  }

  /* Dev Bar */

  void emptyData() {
    jobOffers = {};
    for (var entry in dbs.entries) {
      entry.value.nextCursor = null;
      entry.value.hasMore = true;
    }
    error = false;
    loading = false;
    notifyListeners();
  }

  void emptyFavourites() {
    favourites = {};
    notifyListeners();
  }

  void reloadData() {
    jobOffers = {};
    for (var entry in dbs.entries) {
      entry.value.nextCursor = null;
      entry.value.hasMore = true;
    }

    fetchJobOffers();

    loading = true;
    notifyListeners();
  }

  void toggleError() {
    error = true;
    notifyListeners();
  }

  void setCurrentTabIndex(int index) {
    currentTabIndex = index;
    notifyListeners();
  }

  /* Settings */

  void toggleDevMode() {
    devMode = !devMode;
    notifyListeners();
  }

  /* Search bar */

  void setSearchQuery(String text) {
    searchQuery = text.trim();
  }

  void handleSearch(String text) {
    if (text.isNotEmpty && text.length > 2) {
      setSearchQuery(text);
      fetchJobOffers();
    } else if (searchQuery.isNotEmpty && text.trim() != searchQuery) {
      setSearchQuery('');
      reloadData();
    }
  }

  void setFilters(Map<String, dynamic> newFilters) {
    filters = {...newFilters};

    loading = true;
    notifyListeners();

    fetchJobOffers();
  }
}
