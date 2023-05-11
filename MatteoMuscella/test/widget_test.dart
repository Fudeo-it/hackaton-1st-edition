// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobs_search/providers/main_provider.dart';
import 'package:jobs_search/screens/jobs_list.dart';
import 'package:jobs_search/services/notion_api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([NotionApiService])
void main() {
  late MockNotionApiService apiService;

  setUp(() {
    apiService = MockNotionApiService();
  });

  testWidgets('Jobs list view shows Nessun dato disponibile', (WidgetTester tester) async {
    when(apiService.fetchJobOffers(any, any, any)).thenAnswer(
        (realInvocation) => Future.value(ApiServiceModel([], false, null)));

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => MainProvider(apiService),
        child: MaterialApp(
          title: 'Test App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const JobsList(),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Nessun dato disponibile'), findsOneWidget);
  });
}
