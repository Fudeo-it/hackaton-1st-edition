import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:offertelavoroflutter/app.dart';
import 'package:offertelavoroflutter/services/local/database_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  final databaseService = await DatabaseService.newConnection();

  runApp(
    Provider<Database>(
      create: (_) => databaseService.database,
      child: const App(),
    ),
  );
}
