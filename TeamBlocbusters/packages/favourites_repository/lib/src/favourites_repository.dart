import 'package:local_storage/local_storage.dart';
import 'package:rxdart/rxdart.dart';

const _favouritesKey = 'favourites';

class FavouritesRepository {
  FavouritesRepository({required LocalStorage localStorage})
      : _localStorage = localStorage;

  final LocalStorage _localStorage;
  final _favouritesController = BehaviorSubject<List<String>>();
  var _loaded = false;

  Stream<List<String>> get favourites async* {
    if (!_loaded) {
      final favourites = await _localStorage.load(_favouritesKey);
      _favouritesController
        ..add(favourites?.split(',') ?? [])
        ..listen((value) {
          _localStorage.save(_favouritesKey, value.join(','));
        });
      _loaded = true;
    }
    yield* _favouritesController.stream;
  }

  bool isFavourite(String id) {
    return _favouritesController.valueOrNull?.contains(id) ?? false;
  }

  void toggleFavourite(String id) {
    if (_favouritesController.valueOrNull?.contains(id) ?? false) {
      _removeFavourite(id);
    } else {
      _saveFavourite(id);
    }
  }

  void _saveFavourite(String id) {
    final favourites = _favouritesController.valueOrNull ?? []
      ..add(id);
    _favouritesController.add(favourites);
  }

  void _removeFavourite(String id) {
    final favourites = _favouritesController.valueOrNull ?? []
      ..remove(id);
    _favouritesController.add(favourites);
  }

  void dispose() {
    _favouritesController.close();
  }
}
