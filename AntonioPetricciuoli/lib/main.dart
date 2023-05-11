import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/di/dependency_injector.dart';
import 'package:offertelavoroflutter/routers/routers.dart';
import 'package:offertelavoroflutter/styles.dart';

void main() {
  runApp(const DependencyInjector(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'OfferteLavoroFlutter',
      theme: ThemeData(
        primaryColor: Styles.kPrimaryColor,
        scaffoldBackgroundColor: Styles.kScaffold,
        appBarTheme: AppBarTheme(
          backgroundColor: Styles.kScaffold,
          titleTextStyle: Styles.kTitle,
          iconTheme: const IconThemeData(
            color: Styles.kPrimaryColor,
          ),
        ),
      ),
      routerConfig: Routers().router,
    );
  }
}
