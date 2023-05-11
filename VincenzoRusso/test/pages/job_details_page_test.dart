import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/job_details_bloc/job_details_bloc.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/pages/details_page/job_details_page.dart';
import 'package:offertelavoroflutter_app/widgets/card_notification.dart';
import 'package:offertelavoroflutter_app/widgets/flutter_job_loader.dart';
import 'package:pine/di/dependency_injector_helper.dart';

import '../fixtures/favourite_job_fixture_factory.dart';
import '../fixtures/job_fixture_factory.dart';
import '../widgets/job_list_test.dart';

void main() {
  late MockJobDetailsBloc jobDetailsBloc;
  late MockFavouriteJobBloc favouriteJobBloc;

  late Job job;
  late List<FavouriteJob> favouriteJob;

  setUp(() {
    jobDetailsBloc = MockJobDetailsBloc();
    favouriteJobBloc = MockFavouriteJobBloc();

    job = JobFixture.factory().makeSingle();
  });

  group(
    "testing job details behavior on job list bloc",
    () {
      testWidgets(
        "testing job details fetched job successfully",
        (tester) async {
          favouriteJob = [];

          whenListen(
            jobDetailsBloc,
            Stream.fromIterable([
              const FetchingJobDetailsState(),
              FetchedJobDetailsState(job),
            ]),
            initialState: const FetchingJobDetailsState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteJob)]),
            initialState: LoadedFavouriteJobState(favouriteJob),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<JobDetailsBloc>.value(value: jobDetailsBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: MaterialApp(
                home: JobDetailsPage(jobID: job.id),
              ),
            ),
          );

          expect(find.byType(FlutterJobLoader), findsOneWidget);
          expect(find.byType(CustomScrollView), findsNothing);
          expect(find.byType(CardNotification), findsNothing);
          expect(find.text("Si è verificato un errore"), findsNothing);
          expect(find.text("Nome azienda"), findsNothing);
          expect(find.text("${job.emoji} ${job.qualification}"), findsNothing);

          await tester.pumpAndSettle();

          expect(find.byType(FlutterJobLoader), findsNothing);
          expect(find.byType(CustomScrollView), findsOneWidget);
          expect(find.byType(CardNotification), findsNothing);
          expect(find.text("Si è verificato un errore"), findsNothing);
          expect(find.text("Nome azienda"), findsOneWidget);
          expect(
              find.text("${job.emoji} ${job.qualification}"), findsOneWidget);
        },
      );

      testWidgets(
        "testing job details fetched job  with unexpected error",
        (tester) async {
          favouriteJob = [];

          whenListen(
            jobDetailsBloc,
            Stream.fromIterable([
              const FetchingJobDetailsState(),
              const ErrorJobDetailsState(),
            ]),
            initialState: const FetchingJobDetailsState(),
          );

          whenListen(
            favouriteJobBloc,
            Stream.fromIterable([LoadedFavouriteJobState(favouriteJob)]),
            initialState: LoadedFavouriteJobState(favouriteJob),
          );

          await tester.pumpWidget(
            DependencyInjectorHelper(
              blocs: [
                BlocProvider<JobDetailsBloc>.value(value: jobDetailsBloc),
                BlocProvider<FavouriteJobBloc>.value(value: favouriteJobBloc),
              ],
              child: MaterialApp(
                home: JobDetailsPage(jobID: job.id),
              ),
            ),
          );

          expect(find.byType(FlutterJobLoader), findsOneWidget);
          expect(find.byType(CustomScrollView), findsNothing);
          expect(find.byType(CardNotification), findsNothing);
          expect(find.text("Si è verificato un errore"), findsNothing);
          expect(find.text("Nome azienda"), findsNothing);
          expect(find.text("${job.emoji} ${job.qualification}"), findsNothing);

          await tester.pumpAndSettle();

          expect(find.byType(FlutterJobLoader), findsNothing);
          expect(find.byType(CustomScrollView), findsNothing);
          expect(find.byType(CardNotification), findsOneWidget);
          expect(find.text("Si è verificato un errore"), findsOneWidget);
          expect(find.text("Nome azienda"), findsNothing);
          expect(find.text("${job.emoji} ${job.qualification}"), findsNothing);
        },
      );
    },
  );
}

class MockJobDetailsBloc extends MockBloc<JobDetailsEvent, JobDetailsState>
    implements JobDetailsBloc {}
