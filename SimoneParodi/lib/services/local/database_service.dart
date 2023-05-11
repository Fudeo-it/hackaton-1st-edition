import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseService {
  static const _dbName = 'job_offer.db';
  static const tableFavouriteAnnouncement = 'favourite_announcement';
  static const tableFavouriteFreelanceProject = 'favourite_freelance_project';
  Database database;
  DatabaseService(this.database);

  static Future<DatabaseService> newConnection() async {
    final databasesPath = await getDatabasesPath();
    final databasePath = path.join(databasesPath, _dbName);

    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute("""CREATE TABLE $tableFavouriteAnnouncement (
                        id TEXT PRIMARY KEY,
                        createdOn INTEGER
                    );                    
                    """);
        db.execute("""CREATE TABLE $tableFavouriteFreelanceProject (
                        id TEXT PRIMARY KEY,
                        createdOn INTEGER
                    );                    
                    """);
      },
    );
    return DatabaseService(database);
  }
}
