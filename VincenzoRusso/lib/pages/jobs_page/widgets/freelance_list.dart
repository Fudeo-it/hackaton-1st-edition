import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/freelance_list_bloc/freelance_list_bloc.dart';
import 'package:offertelavoroflutter_app/models/enum/relationship.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:offertelavoroflutter_app/widgets/card_notification.dart';
import 'package:offertelavoroflutter_app/widgets/flutter_job_loader.dart';
import 'package:offertelavoroflutter_app/widgets/tag_color.dart';

class FreelanceList extends StatelessWidget {
  const FreelanceList({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FreelanceListBloc, FreelanceListState>(
        builder: (context, state) {
          if (state is FetchingFreelanceListState) {
            return const Center(
              child: FlutterJobLoader(),
            );
          }

          if (state is FetchedFreelanceListState) {
            return _FreelanceListContent(
              jobs: state.freelanceJobs,
            );
          }

          if (state is NoFreelanceListState) {
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

          if (state is ErrorFreelanceListState) {
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

class _FreelanceListContent extends StatelessWidget {
  final List<JobFreelance> jobs;

  const _FreelanceListContent({
    required this.jobs,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FavouriteJobBloc, FavouriteJobState>(
        builder: (context, stateFavourite) {
          return RefreshIndicator(
            onRefresh: () async =>
                context.read<FreelanceListBloc>().fetchFreelance(),
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
                  _FreelanceTile(
                    job: jobs[index],
                    onPressed: () {
                      context.router.push(
                        FreelanceDetailsRoute(jobID: jobs[index].id),
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

class _FreelanceTile extends StatelessWidget {
  final JobFreelance job;
  final GestureTapCallback? onPressed;

  const _FreelanceTile({
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
                  job.code,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Visibility(
                visible: job.relationship != Relationship.undefined,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: TagColor(
                    text: job.relationship.getString,
                    backgroundColor: job.relationship.color,
                    color: job.relationship.colorText,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
