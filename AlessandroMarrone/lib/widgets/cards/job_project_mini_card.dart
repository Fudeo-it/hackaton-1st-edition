import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/cubits/bookmark_save_cubit.dart';
import 'package:offertelavoroflutter_it_app/cubits/bookmarks_retrieve/bookmarks_retrieve_cubit.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/auto_size_text_widget.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';

class JobProjectMiniCard extends StatelessWidget {
  final JobProjectModel jobProject;
  final VoidCallback? openContainer;
  const JobProjectMiniCard(
      {Key? key, this.openContainer, required this.jobProject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarkSaveCubit>(
      create: (context) => BookmarkSaveCubit(
        jobRepository: context.read<JobRepository>(),
      )..checkBookmark(jobProject.id),
      child: Material(
        elevation: 30.0,
        shadowColor: const Color(0xffe0e0e0),
        child: InkWell(
          onTap: openContainer,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 10.0,
                  color: Color(0xffe0e0e0),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<BookmarkSaveCubit, bool>(
                      builder: (context, isSaved) => Icon(
                        isSaved
                            ? LucideIcons.bookmarkPlus
                            : LucideIcons.bookmarkMinus,
                        size: 18.0,
                        color: isSaved ? K.primaryColor : K.secondaryColor,
                      ),
                    )
                  ],
                ),
                AutoSizeTextWidget(
                  jobProject.projectDetails.jobTitle!.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                  maxFontSize: 12.0,
                  minFontSize: 8.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconItem(
                            icon: LucideIcons.coins,
                            width: 25.0,
                            height: 25.0,
                            iconSize: 14.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: AutoSizeTextWidget(
                                jobProject.projectDetails.jobBudget != null &&
                                        jobProject.projectDetails.jobBudget!
                                                .text.length <=
                                            100
                                    ? jobProject
                                            .projectDetails.jobBudget?.text ??
                                        AppLocalizations.of(context)
                                            ?.text_empty_item ??
                                        "text_empty_item"
                                    : "€ 70/ora", // TODO: da verificare e sistemare una volta che saranno disponibili annunci reali
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        IconItem(
                          icon: LucideIcons.network,
                          width: 25.0,
                          height: 25.0,
                          iconSize: 14.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: AutoSizeTextWidget(
                              jobProject.projectDetails.employRelationship
                                      ?.text ??
                                  AppLocalizations.of(context)
                                      ?.text_empty_item ??
                                  "text_empty_item",
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
