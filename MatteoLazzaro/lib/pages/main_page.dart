import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/blocs/jobs/jobs_bloc.dart';
import 'package:offertelavoroflutter/models/job.dart';
import 'package:offertelavoroflutter/repositories/jobs_repository.dart';
import 'package:offertelavoroflutter/widgets/courtesy_widget.dart';
import 'package:offertelavoroflutter/widgets/job_widget.dart';
import 'package:offertelavoroflutter/widgets/loading_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => JobsBloc(
          jobsRepository: context.read<JobsRepository>(),
        )..fetchJobs(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Jobs'),
          ),
          body: _body(context),
        ),
      );
}

Widget _body(BuildContext context) {
  final items = [
    BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        if (state is FetchedJobsState) {
          return _listWidget(
            context,
            jobs: state.jobs,
          );
        } else if (state is ErrorJobsState) {
          return Center(
            child: CourtesyWidget(
              title: 'Uh oh!',
              subtitle: state.errorMessage ?? 'Generic error',
            ),
          );
        } else if (state is NoJobsState) {
          return const Center(
            child: CourtesyWidget(title: 'Ops', subtitle: 'No match available'),
          );
        }
        return const LoadingWidget();
      },
    )
  ];

  return ListView.builder(
    itemBuilder: (_, index) => items[index],
    itemCount: items.length,
  );
}

Widget _listWidget(
  BuildContext context, {
  List<Job> jobs = const [],
}) =>
    ListView.separated(
      separatorBuilder: (context, index) => const Divider(color: Colors.black),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 4.0,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) => JobWidget(jobs[index]),
      itemCount: jobs.length,
    );
