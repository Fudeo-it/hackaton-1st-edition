import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/models/enum/job_type.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class FavouriteList extends StatelessWidget {
  final List<FavouriteJob> favourites;
  final bool shrinkWrap;

  const FavouriteList({
    super.key,
    required this.favourites,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        physics: shrinkWrap
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        shrinkWrap: shrinkWrap,
        padding: EdgeInsets.zero,
        itemCount: favourites.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            context.router.pop();

            if (favourites[index].jobType == JobType.office) {
              context.router.push(
                JobDetailsRoute(
                  jobID: favourites[index].id,
                ),
              );
            } else if (favourites[index].jobType == JobType.freelance) {
              context.router.push(
                FreelanceDetailsRoute(
                  jobID: favourites[index].id,
                ),
              );
            }
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          dense: false,
          horizontalTitleGap: 0,
          title: Text(favourites[index].position),
          subtitle: Text(favourites[index].company),
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(favourites[index].emoji),
            ],
          ),
          trailing: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.solidCircleXmark,
              color: AppColors.red,
            ),
            onPressed: () => context
                .read<FavouriteJobBloc>()
                .removeFavourite(favourites[index]),
          ),
        ),
      );
}
