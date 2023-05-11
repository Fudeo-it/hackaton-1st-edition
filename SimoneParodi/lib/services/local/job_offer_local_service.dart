import 'package:offertelavoroflutter/errors/local_error.dart';
import 'package:offertelavoroflutter/services/local/database_service.dart';
import 'package:sqflite/sqflite.dart';

class JobOfferLocalService {
  final Database database;

  JobOfferLocalService({
    required this.database,
  });

  Future<List<String>> getFavouriteAnnouncements() async {
    final records = await database.query(
      DatabaseService.tableFavouriteAnnouncement,
    );
    return records.map((e) => e['id'] as String).toList(
          growable: false,
        );
  }

  Future<List<String>> getFavouriteFreelanceProjects() async {
    final records = await database.query(
      DatabaseService.tableFavouriteFreelanceProject,
    );
    return records.map((e) => e['id'] as String).toList(
          growable: false,
        );
  }

  Future<void> _addFavourite({
    required String id,
    required String table,
  }) async {
    try {
      await database.insert(table, {
        'id': id,
        'createdOn': DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      throw LocalError(errorMessage: e.toString());
    }
  }

  Future<void> _deleteFavourite({
    required String id,
    required String table,
  }) async {
    try {
      await database.delete(
        table,
        where: 'id = ?',
        whereArgs: [
          id,
        ],
      );
    } catch (e) {
      throw LocalError(errorMessage: e.toString());
    }
  }

  void addFavouriteFreelanceProjects({
    required String id,
  }) {
    _addFavourite(
      id: id,
      table: DatabaseService.tableFavouriteFreelanceProject,
    );
  }

  void addFavouriteAnnouncement({
    required String id,
  }) {
    _addFavourite(
      id: id,
      table: DatabaseService.tableFavouriteAnnouncement,
    );
  }

  void deleteFavouriteAnnouncement({
    required String id,
  }) {
    _deleteFavourite(
      id: id,
      table: DatabaseService.tableFavouriteAnnouncement,
    );
  }

  void multiDeleteFavouriteAnnouncement({
    required List<String> ids,
  }) {
    for (String id in ids) {
      _deleteFavourite(
        id: id,
        table: DatabaseService.tableFavouriteAnnouncement,
      );
    }
  }

  void multiDeleteFavouriteFreelanceProjects({
    required List<String> ids,
  }) {
    for (String id in ids) {
      _deleteFavourite(
        id: id,
        table: DatabaseService.tableFavouriteFreelanceProject,
      );
    }
  }

  void deleteFavouriteFreelanceProjects({
    required String id,
  }) {
    _deleteFavourite(
      id: id,
      table: DatabaseService.tableFavouriteFreelanceProject,
    );
  }
}
