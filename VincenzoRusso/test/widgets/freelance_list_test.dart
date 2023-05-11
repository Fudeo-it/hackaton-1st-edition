import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/freelance_list_bloc/freelance_list_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/job_list_bloc/job_list_bloc.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/pages/details_page/job_details_page.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/freelance_list.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/jobs_list.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/widgets/card_notification.dart';
import 'package:offertelavoroflutter_app/widgets/flutter_job_loader.dart';
import 'package:pine/pine.dart';

import '../fixtures/favourite_job_fixture_factory.dart';
import '../fixtures/job_fixture_factory.dart';
import '../fixtures/job_freelance_fixture_factory.dart';
import 'job_list_test.mocks.dart';

@GenerateMocks([StackRouter])
void main() {
  late MockStackRouter stackRouter;

  late MockFreelanceListBloc freelanceListBloc;
  late MockFavouriteJobBloc favouriteJobBloc;

  late List<JobFreelance> jobs;
  late List<FavouriteJob> favouriteList;

  late Filters filters;
  late Sorts sorts;
  late bool hasMore;

  setUp(() {
    stackRouter = MockStackRouter();
    freelanceListBloc = MockFreelanceListBloc();
    favouriteJobBloc = MockFavouriteJobBloc();
    jobs = JobFreelanceFixture.factory().makeMany(3);
    favouriteList = FavouriteJobFixture.factory().makeMany(3);
    filters = const Filters();
    sorts = const Sorts();
    hasMore = false;
  });

  group(
    "testing job freelance list widget behavior",
    () {
      testWidgets(
        "testing fetch freelance job list successfully",
        (tester) async {
          whenListen(
            freelanceListBloc,
            Stream.fromIterable([
              const FetchingFreelanceListState(),
              FetchedFreelanceListState(
                freelanceJobs: jobs,
                hasMore: hasMore,
                filters: filters,
                sorts: sorts,
              ),
            ]),
            initialState: const FetchingFreelanceListState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteList)]),
            initialState: LoadedFavouriteJobState(favouriteList),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<FreelanceListBloc>.value(value: freelanceListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: const MaterialApp(
                home: FreelanceList(),
              ),
            ),
          );

          expect(find.byType(FlutterJobLoader), findsOneWidget);
          expect(find.byType(ListView), findsNothing);
          expect(find.byType(CardNotification), findsNothing);
          expect(find.text("Ci dispiace!"), findsNothing);
          expect(find.text("Si è verificato un errore"), findsNothing);

          await tester.pumpAndSettle();

          expect(find.byType(FlutterJobLoader), findsNothing);
          expect(find.byType(ListView), findsOneWidget);
          expect(find.byType(CardNotification), findsNothing);
          expect(find.text("Ci dispiace!"), findsNothing);
          expect(find.text("Si è verificato un errore"), findsNothing);
        },
      );

      testWidgets(
        "testing fetch freelance job no list successfully",
        (tester) async {
          whenListen(
            freelanceListBloc,
            Stream.fromIterable([
              const FetchingFreelanceListState(),
              const NoFreelanceListState(),
            ]),
            initialState: const FetchingFreelanceListState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteList)]),
            initialState: LoadedFavouriteJobState(favouriteList),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<FreelanceListBloc>.value(value: freelanceListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: const MaterialApp(
                home: FreelanceList(),
              ),
            ),
          );

          expect(find.byType(FlutterJobLoader), findsOneWidget);
          expect(find.byType(ListView), findsNothing);
          expect(find.byType(CardNotification), findsNothing);
          expect(find.text("Ci dispiace!"), findsNothing);
          expect(find.text("Si è verificato un errore"), findsNothing);

          await tester.pumpAndSettle();

          expect(find.byType(FlutterJobLoader), findsNothing);
          expect(find.byType(ListView), findsNothing);
          expect(find.byType(CardNotification), findsOneWidget);
          expect(find.text("Ci dispiace!"), findsOneWidget);
          expect(find.text("Si è verificato un errore"), findsNothing);
        },
      );

      testWidgets(
        "testing fetch freelance job  list with unexpected error",
        (tester) async {
          whenListen(
            freelanceListBloc,
            Stream.fromIterable([
              const FetchingFreelanceListState(),
              const ErrorFreelanceListState(),
            ]),
            initialState: const FetchingFreelanceListState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteList)]),
            initialState: LoadedFavouriteJobState(favouriteList),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<FreelanceListBloc>.value(value: freelanceListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: const MaterialApp(
                home: FreelanceList(),
              ),
            ),
          );

          expect(find.byType(FlutterJobLoader), findsOneWidget);
          expect(find.byType(ListView), findsNothing);
          expect(find.byType(CardNotification), findsNothing);
          expect(find.text("Ci dispiace!"), findsNothing);
          expect(find.text("Si è verificato un errore"), findsNothing);

          await tester.pumpAndSettle();

          expect(find.byType(FlutterJobLoader), findsNothing);
          expect(find.byType(ListView), findsNothing);
          expect(find.byType(CardNotification), findsOneWidget);
          expect(find.text("Ci dispiace!"), findsNothing);
          expect(find.text("Si è verificato un errore"), findsOneWidget);
        },
      );
    },
  );
  group(
    "testing navigation behavior",
    () {
      testWidgets(
        "testing navigation to job details",
        (tester) async {
          whenListen(
            freelanceListBloc,
            Stream.fromIterable([
              FetchedFreelanceListState(
                freelanceJobs: jobs,
                hasMore: hasMore,
                filters: filters,
                sorts: sorts,
              ),
            ]),
            initialState: FetchedFreelanceListState(
              freelanceJobs: jobs,
              hasMore: hasMore,
              filters: filters,
              sorts: sorts,
            ),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteList)]),
            initialState: LoadedFavouriteJobState(favouriteList),
          );

          when(
            stackRouter.push(
              FreelanceDetailsRoute(jobID: jobs.first.id),
            ),
          ).thenAnswer((_) async => true);

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<FreelanceListBloc>.value(value: freelanceListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: StackRouterScope(
                stateHash: 1,
                controller: stackRouter,
                child: const MaterialApp(
                  home: FreelanceList(),
                ),
              ),
            ),
          );

          expect(find.byType(JobDetailsPage), findsNothing);

          expect(find.text(jobs.first.code), findsOneWidget);

          await tester.tap(find.text(jobs.first.code));

          await tester.pumpAndSettle();

          verify(stackRouter.push(FreelanceDetailsRoute(jobID: jobs.first.id)))
              .called(1);
          expect(find.byType(JobDetailsPage), findsNothing);
        },
      );
    },
  );
}

class MockFreelanceListBloc
    extends MockBloc<FreelanceListEvent, FreelanceListState>
    implements FreelanceListBloc {}

class MockFavouriteJobBloc
    extends MockBloc<FavouriteJobEvent, FavouriteJobState>
    implements FavouriteJobBloc {}
