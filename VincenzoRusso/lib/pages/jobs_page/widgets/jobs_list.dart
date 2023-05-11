import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/job_list_bloc/job_list_bloc.dart';
import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:offertelavoroflutter_app/widgets/card_notification.dart';
import 'package:offertelavoroflutter_app/widgets/flutter_job_loader.dart';
import 'package:offertelavoroflutter_app/widgets/tag_color.dart';

class JobsList extends StatelessWidget {
  const JobsList({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<JobListBloc, JobListState>(
        builder: (context, state) {
          if (state is FetchingJobListState) {
            return const Center(
              child: FlutterJobLoader(),
            );
          }

          if (state is FetchedJobListState) {
            return _JobsListContent(
              jobs: state.jobs,
            );
          }

          if (state is NoJobListState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: const [
                  CardNotification(
                    title: "Ci dispiace!",
                    message:
                        "Non sono presenti annunci al momento. Riprova più tardi.",
                  ),
                ],
              ),
            );
          }

          if (state is ErrorJobListState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: const [
                  CardNotification(
                    title: "Si è verificato un errore",
                    message: "Non è possibile caricare o trovare gli annunci.",
                    error: true,
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      );
}

class _JobsListContent extends StatelessWidget {
  final List<Job> jobs;

  const _JobsListContent({
    required this.jobs,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FavouriteJobBloc, FavouriteJobState>(
        builder: (context, stateFavourite) {
          return RefreshIndicator(
            onRefresh: () async =>
                context.read<JobListBloc>().fetchFirstPageJobs(),
            color: AppColors.primaryLight,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              itemCount: jobs.length,
              separatorBuilder: (_, index) => const Divider(),
              itemBuilder: (_, index) => Column(
                children: [
                  _JobTile(
                    job: jobs[index],
                    onPressed: () {
                      context.router.push(
                        JobDetailsRoute(jobID: jobs[index].id),
                      );
                    },
                  ),
                  Visibility(
                    visible: _isFavourite(
                      (stateFavourite is LoadedFavouriteJobState
                          ? stateFavourite.favouriteJob
                          : []),
                      jobs[index].id,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 4.0,
                        bottom: 0.0,
                      ),
                      child: Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.solidBookmark,
                            size: 8.0,
                            color: AppColors.primaryLight,
                          ),
                          const SizedBox(width: 4.0),
                          Expanded(
                            child: Container(
                              color: AppColors.primaryLight,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  bool _isFavourite(List<FavouriteJob> list, String jobId) {
    final favouriteIds = list.map((e) => e.id);

    return favouriteIds.contains(jobId);
  }
}

class _JobTile extends StatelessWidget {
  final Job job;
  final GestureTapCallback? onPressed;

  const _JobTile({
    required this.job,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 20,
              child: Text(job.emoji),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  job.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  job.ral,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: job.seniority != Seniority.undefined,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: TagColor(
                        text: job.seniority.getString,
                        backgroundColor: job.seniority.color,
                        color: job.seniority.colorText,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: job.contract != ContractType.undefined,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: TagColor(
                        text: job.contract.getString,
                        backgroundColor: job.contract.color,
                        color: job.contract.colorText,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: job.team != TeamLocation.undefined,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: TagColor(
                        text: job.team.getString,
                        backgroundColor: job.team.color,
                        color: job.team.colorText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
