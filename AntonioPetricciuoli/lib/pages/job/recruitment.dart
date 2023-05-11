import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:offertelavoroflutter/blocs/jobs/jobs_bloc.dart';
import 'package:offertelavoroflutter/cubits/cubits.dart';
import 'package:offertelavoroflutter/misc/misc.dart';
import 'package:offertelavoroflutter/models/models.dart';
import 'package:offertelavoroflutter/styles.dart';
import 'package:offertelavoroflutter/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

class RecruitmentPage extends StatelessWidget {
  const RecruitmentPage({super.key, required this.recruitment});

  final Recruitment recruitment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: InkWell(
            onTap: () => context.pop(),
            borderRadius: Styles.kBorderRadius,
            child: const Icon(
              Ionicons.arrow_back_outline,
              color: Styles.kSecondaryColor,
            ),
          ),
        ),
        actions: [
          BlocBuilder<JobsBloc, JobsState>(
            builder: (context, state) {
              final job = state.recruitment
                  .firstWhere((element) => element.id == recruitment.id);

              return CustomIconButton(
                icon: job.isSaved!
                    ? Ionicons.bookmark
                    : Ionicons.bookmark_outline,
                color: job.isSaved!
                    ? Styles.kPrimaryColor
                    : Styles.kSecondaryColor,
                onTap: () {
                  context
                      .read<JobsBloc>()
                      .add(JobSave(id: recruitment.id ?? ''));
                },
              );
            },
          ),
          CustomIconButton(
            icon: Ionicons.share,
            onTap: () {
              Share.share(
                'Offerta di lavoro per assunzione: ${recruitment.name} - ${recruitment.location} - ${recruitment.date} - ${recruitment.howToApply}',
                subject: recruitment.name,
              );
            },
          )
        ],
        backgroundColor: Styles.kScaffold,
        elevation: 1,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: Styles.kPaddingAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Styles.kPrimaryColor,
                            borderRadius: Styles.kBorderRadius,
                          ),
                          child: Text(
                            recruitment.icon ?? '',
                            style: Styles.kBigTitle.copyWith(
                              color: Styles.kSecondaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          recruitment.name ?? '',
                          style: Styles.kTitle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${recruitment.location} - ${recruitment.date}',
                          style: Styles.kSubtitle,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            recruitment.ral!.isNotEmpty
                                ? CustomChip(
                                    icon: Ionicons.cash,
                                    title: recruitment.ral ?? '',
                                    color: Styles.kSuccessColor,
                                  )
                                : const SizedBox.shrink(),
                            recruitment.team!.isNotEmpty
                                ? CustomChip(
                                    icon: Ionicons.document_text,
                                    title: recruitment.team ?? '',
                                    color: Styles.kFlutterBlue,
                                  )
                                : const SizedBox.shrink(),
                            recruitment.seniority!.isNotEmpty
                                ? CustomChip(
                                    icon: Ionicons.briefcase,
                                    title: recruitment.seniority ?? '',
                                    color: Styles.kFlutterNavy,
                                  )
                                : const SizedBox.shrink(),
                            recruitment.contract!.isNotEmpty
                                ? CustomChip(
                                    icon: Ionicons.time,
                                    title: recruitment.contract ?? '',
                                    color: Styles.kWarningColor,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text("Descrizione dell'offerta", style: Styles.kTitle),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            recruitment.offerDescription ?? '',
                            style: Styles.kBody,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                title: "Candidati",
                onTap: () {
                  if (Misc.emailRegExp.hasMatch(recruitment.howToApply ?? '')) {
                    Misc.openUrl(Uri.parse('mailto:${recruitment.howToApply}'));
                  } else {
                    Misc.openUrl(Uri.parse(recruitment.howToApply ?? ''));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
