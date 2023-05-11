import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/job_list_bloc/job_list_bloc.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/pages/details_page/job_details_page.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/jobs_list.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/widgets/card_notification.dart';
import 'package:offertelavoroflutter_app/widgets/flutter_job_loader.dart';
import 'package:pine/pine.dart';

import '../fixtures/favourite_job_fixture_factory.dart';
import '../fixtures/job_fixture_factory.dart';
import 'job_list_test.mocks.dart';

@GenerateMocks([StackRouter])
void main() {
  late MockStackRouter stackRouter;

  late MockJobListBloc jobListBloc;
  late MockFavouriteJobBloc favouriteJobBloc;

  late List<Job> jobs;
  late List<FavouriteJob> favouriteList;

  late Filters filters;
  late Sorts sorts;
  late bool hasMore;

  setUp(() {
    stackRouter = MockStackRouter();
    jobListBloc = MockJobListBloc();
    favouriteJobBloc = MockFavouriteJobBloc();
    jobs = JobFixture.factory().makeMany(3);
    favouriteList = FavouriteJobFixture.factory().makeMany(3);
    filters = const Filters();
    sorts = const Sorts();
    hasMore = false;
  });

  group(
    "testing job list widget",
    () {
      testWidgets(
        "testing fetch job list successfully",
        (tester) async {
          whenListen(
            jobListBloc,
            Stream.fromIterable([
              const FetchingJobListState(),
              FetchedJobListState(
                jobs: jobs,
                hasMore: hasMore,
                filters: filters,
                sorts: sorts,
              ),
            ]),
            initialState: const FetchingJobListState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteList)]),
            initialState: LoadedFavouriteJobState(favouriteList),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<JobListBloc>.value(value: jobListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: const MaterialApp(
                home: JobsList(),
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
        "testing fetch job no list successfully",
        (tester) async {
          whenListen(
            jobListBloc,
            Stream.fromIterable([
              const FetchingJobListState(),
              const NoJobListState(),
            ]),
            initialState: const FetchingJobListState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteList)]),
            initialState: LoadedFavouriteJobState(favouriteList),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<JobListBloc>.value(value: jobListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: const MaterialApp(
                home: JobsList(),
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
        "testing fetch job  list with unexpected error",
        (tester) async {
          whenListen(
            jobListBloc,
            Stream.fromIterable([
              const FetchingJobListState(),
              const ErrorJobListState(),
            ]),
            initialState: const FetchingJobListState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteList)]),
            initialState: LoadedFavouriteJobState(favouriteList),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<JobListBloc>.value(value: jobListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: const MaterialApp(
                home: JobsList(),
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
            jobListBloc,
            Stream.fromIterable([
              FetchedJobListState(
                jobs: jobs,
                hasMore: hasMore,
                filters: filters,
                sorts: sorts,
              ),
            ]),
            initialState: FetchedJobListState(
              jobs: jobs,
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
              JobDetailsRoute(jobID: jobs.first.id),
            ),
          ).thenAnswer((_) async => true);

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<JobListBloc>.value(value: jobListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: StackRouterScope(
                stateHash: 1,
                controller: stackRouter,
                child: const MaterialApp(
                  home: JobsList(),
                ),
              ),
            ),
          );

          expect(find.byType(JobDetailsPage), findsNothing);

          expect(find.text(jobs.first.title), findsOneWidget);

          await tester.tap(find.text(jobs.first.title));

          await tester.pumpAndSettle();

          verify(stackRouter.push(JobDetailsRoute(jobID: jobs.first.id)))
              .called(1);
          expect(find.byType(JobDetailsPage), findsNothing);
        },
      );
    },
  );
}

class MockJobListBloc extends MockBloc<JobListEvent, JobListState>
    implements JobListBloc {}

class MockFavouriteJobBloc
    extends MockBloc<FavouriteJobEvent, FavouriteJobState>
    implements FavouriteJobBloc {}
