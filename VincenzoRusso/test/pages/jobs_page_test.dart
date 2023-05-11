import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/freelance_list_bloc/freelance_list_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/job_list_bloc/job_list_bloc.dart';
import 'package:offertelavoroflutter_app/models/enum/sort_type.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/jobs_page.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/freelance_list.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/jobs_list.dart';
import 'package:pine/pine.dart';

import '../fixtures/favourite_job_fixture_factory.dart';
import '../fixtures/job_fixture_factory.dart';
import '../fixtures/job_freelance_fixture_factory.dart';
import '../widgets/freelance_list_test.dart';
import '../widgets/job_list_test.dart';

void main() {
  late MockJobListBloc jobListBloc;
  late MockFreelanceListBloc freelanceListBloc;
  late MockFavouriteJobBloc favouriteJobBloc;

  late Filters filtersJob;
  late Sorts sortsJob;
  late Filters filtersFreelance;
  late Sorts sortsFreelance;
  late bool hasMore;
  late List<Job> jobs;
  late List<JobFreelance> freelanceJob;
  late List<FavouriteJob> favouriteJobs;

  setUp(() {
    jobListBloc = MockJobListBloc();
    freelanceListBloc = MockFreelanceListBloc();
    favouriteJobBloc = MockFavouriteJobBloc();

    jobs = JobFixture.factory().makeMany(3);
    freelanceJob = JobFreelanceFixture.factory().makeMany(3);
    favouriteJobs = FavouriteJobFixture.factory().makeMany(3);
  });

  group(
    "testing jobs page behavior",
    () {
      testWidgets(
        "testing in jobs page exsist job list with initialPage 0",
        (tester) async {
          filtersJob = const Filters(textFilter: "mobile");
          sortsJob = const Sorts(team: SortType.descending);
          filtersFreelance = const Filters(codeFilter: "mobile");
          sortsFreelance = const Sorts(relationship: SortType.descending);
          hasMore = false;

          const jobsPage = JobsPage(initialPage: 0);

          whenListen(
            jobListBloc,
            Stream.fromIterable([
              const FetchingJobListState(),
              FetchedJobListState(
                jobs: jobs,
                hasMore: hasMore,
                filters: filtersJob,
                sorts: sortsJob,
              ),
            ]),
            initialState: const FetchingJobListState(),
          );

          whenListen(
            freelanceListBloc,
            Stream.fromIterable([
              const FetchingFreelanceListState(),
              FetchedFreelanceListState(
                freelanceJobs: freelanceJob,
                hasMore: hasMore,
                filters: filtersFreelance,
                sorts: sortsFreelance,
              ),
            ]),
            initialState: const FetchingFreelanceListState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteJobs)]),
            initialState: LoadedFavouriteJobState(favouriteJobs),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<JobListBloc>.value(value: jobListBloc),
                BlocProvider<FreelanceListBloc>.value(value: freelanceListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: const MaterialApp(
                home: jobsPage,
              ),
            ),
          );
          final JobsPageState pageStates =
              tester.state<JobsPageState>(find.byType(JobsPage));

          expect(find.text("Offerte"), findsOneWidget);
          expect(find.byType(JobsList), findsOneWidget);
          expect(find.byType(FreelanceList), findsNothing);
          expect(pageStates.filtersJob, filtersJob);
          expect(pageStates.filtersFreelance, filtersFreelance);
          expect(pageStates.sortsJob, sortsJob);
          expect(pageStates.sortsFreelance, sortsFreelance);
          expect(pageStates.hasMoreFreelance, hasMore);
          expect(pageStates.hasMoreJobs, hasMore);

          await tester.pumpAndSettle();
          expect(find.text("Offerte"), findsOneWidget);
          expect(find.byType(JobsList), findsOneWidget);
          expect(find.byType(FreelanceList), findsNothing);
          expect(pageStates.filtersJob, filtersJob);
          expect(pageStates.filtersFreelance, filtersFreelance);
          expect(pageStates.sortsJob, sortsJob);
          expect(pageStates.sortsFreelance, sortsFreelance);
          expect(pageStates.hasMoreFreelance, hasMore);
          expect(pageStates.hasMoreJobs, hasMore);
        },
      );

      testWidgets(
        "testing in jobs page exsist freelance list with initialPage 1",
        (tester) async {
          filtersJob = const Filters(textFilter: "mobile");
          sortsJob = const Sorts(team: SortType.descending);
          filtersFreelance = const Filters(codeFilter: "mobile");
          sortsFreelance = const Sorts(relationship: SortType.descending);
          hasMore = false;

          const jobsPage = JobsPage(initialPage: 1);

          whenListen(
            jobListBloc,
            Stream.fromIterable([
              const FetchingJobListState(),
              FetchedJobListState(
                jobs: jobs,
                hasMore: hasMore,
                filters: filtersJob,
                sorts: sortsJob,
              ),
            ]),
            initialState: const FetchingJobListState(),
          );

          whenListen(
            freelanceListBloc,
            Stream.fromIterable([
              const FetchingFreelanceListState(),
              FetchedFreelanceListState(
                freelanceJobs: freelanceJob,
                hasMore: hasMore,
                filters: filtersFreelance,
                sorts: sortsFreelance,
              ),
            ]),
            initialState: const FetchingFreelanceListState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteJobs)]),
            initialState: LoadedFavouriteJobState(favouriteJobs),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<JobListBloc>.value(value: jobListBloc),
                BlocProvider<FreelanceListBloc>.value(value: freelanceListBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: const MaterialApp(
                home: jobsPage,
              ),
            ),
          );
          final JobsPageState pageStates =
              tester.state<JobsPageState>(find.byType(JobsPage));

          expect(find.text("Offerte"), findsOneWidget);
          expect(find.byType(JobsList), findsOneWidget);
          expect(find.byType(FreelanceList), findsNothing);
          expect(pageStates.filtersJob, filtersJob);
          expect(pageStates.filtersFreelance, filtersFreelance);
          expect(pageStates.sortsJob, sortsJob);
          expect(pageStates.sortsFreelance, sortsFreelance);
          expect(pageStates.hasMoreFreelance, hasMore);
          expect(pageStates.hasMoreJobs, hasMore);

          await tester.pumpAndSettle();
          expect(find.text("Offerte"), findsOneWidget);
          expect(find.byType(JobsList), findsNothing);
          expect(find.byType(FreelanceList), findsOneWidget);
          expect(pageStates.filtersJob, filtersJob);
          expect(pageStates.filtersFreelance, filtersFreelance);
          expect(pageStates.sortsJob, sortsJob);
          expect(pageStates.sortsFreelance, sortsFreelance);
          expect(pageStates.hasMoreFreelance, hasMore);
          expect(pageStates.hasMoreJobs, hasMore);
        },
      );
    },
  );
}

class MockFavouriteJobBloc
    extends MockBloc<FavouriteJobEvent, FavouriteJobState>
    implements FavouriteJobBloc {}
