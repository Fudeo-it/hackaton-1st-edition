import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/pages/home/home_page.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/jobs_page.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/widgets/job_flutter_button.dart';
import 'package:pine/di/dependency_injector_helper.dart';

import '../fixtures/favourite_job_fixture_factory.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([
  StackRouter,
])
void main() {
  late MockStackRouter stackRouter;
  late MockFavouriteJobBloc favouriteJobBloc;

  late List<FavouriteJob> favouriteJob;

  setUp(() {
    stackRouter = MockStackRouter();
    favouriteJobBloc = MockFavouriteJobBloc();

    favouriteJob = FavouriteJobFixture.factory().makeMany(3);
  });

  group(
    "testing home page",
    () {
      testWidgets(
        "testing layout home page and successfully fetched favourite job",
        (widgetTester) async {
          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([
              const LoadingFavouriteJobState(),
              LoadedFavouriteJobState(favouriteJob)
            ]),
            initialState: const LoadingFavouriteJobState(),
          );

          await widgetTester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: const MaterialApp(
                home: HomePage(),
              ),
            ),
          );

          expect(find.byType(ListView), findsOneWidget);
          expect(find.text("Le tue offerte:"), findsNothing);
          expect(find.byType(JobFlutterButton), findsOneWidget);

          await widgetTester.pumpAndSettle();
          await widgetTester.scrollUntilVisible(
            find.text("Le tue offerte:"),
            500.0,
            scrollable: find.byType(Scrollable),
          );
          await widgetTester.pumpAndSettle();

          expect(find.text("Le tue offerte:"), findsOneWidget);
          expect(find.byType(ListView), findsWidgets);
          expect(find.byType(JobFlutterButton), findsOneWidget);
        },
      );
    },
  );

  group(
    "testing navigation behavior",
    () {
      testWidgets(
        "testing navigation to jobs page with index 0",
        (tester) async {
          const listView = Key("first list view");
          const jobButton = Key("go to jobs");

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteJob)]),
            initialState: LoadedFavouriteJobState(favouriteJob),
          );

          when(stackRouter.push(JobsRoute(initialPage: 0)))
              .thenAnswer((_) async => true);

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: StackRouterScope(
                stateHash: 1,
                controller: stackRouter,
                child: const MaterialApp(
                  home: HomePage(),
                ),
              ),
            ),
          );

          expect(find.byType(JobsPage), findsNothing);
          expect(find.byKey(listView), findsOneWidget);

          await tester.scrollUntilVisible(
            find.byKey(jobButton),
            500.0,
            scrollable: find.byType(Scrollable),
          );

          expect(find.byKey(jobButton), findsOneWidget);

          await tester.tap(find.byKey(jobButton));
          await tester.pumpAndSettle();

          verify(stackRouter.push(JobsRoute(initialPage: 0))).called(1);
          expect(find.byType(JobsPage), findsNothing);
        },
      );

      testWidgets(
        "testing navigation to jobs page with index 1",
        (tester) async {
          const listView = Key("first list view");

          const freelanceButton = Key("go to freelance");

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteJob)]),
            initialState: LoadedFavouriteJobState(favouriteJob),
          );

          when(stackRouter.push(JobsRoute(initialPage: 1)))
              .thenAnswer((_) async => true);

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: StackRouterScope(
                stateHash: 1,
                controller: stackRouter,
                child: const MaterialApp(
                  home: HomePage(),
                ),
              ),
            ),
          );

          expect(find.byType(JobsPage), findsNothing);
          expect(find.byKey(listView), findsOneWidget);

          await tester.scrollUntilVisible(
            find.byKey(freelanceButton),
            500.0,
            scrollable: find.byType(Scrollable),
          );

          expect(find.byKey(freelanceButton), findsOneWidget);

          await tester.tap(find.byKey(freelanceButton));
          await tester.pumpAndSettle();

          verify(stackRouter.push(JobsRoute(initialPage: 1))).called(1);
          expect(find.byType(JobsPage), findsNothing);
        },
      );
    },
  );
}

class MockFavouriteJobBloc
    extends MockBloc<FavouriteJobEvent, FavouriteJobState>
    implements FavouriteJobBloc {}
