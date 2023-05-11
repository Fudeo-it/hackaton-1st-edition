import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:offertelavoroflutter/blocs/blocs.dart';
import 'package:offertelavoroflutter/models/models.dart';
import 'package:offertelavoroflutter/styles.dart';
import 'package:offertelavoroflutter/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

class FreelancePage extends StatelessWidget {
  const FreelancePage({super.key, required this.freelance});

  final Freelance freelance;

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
              final job = state.freelance
                  .firstWhere((element) => element.id == freelance.id);

              return CustomIconButton(
                icon: job.isSaved!
                    ? Ionicons.bookmark
                    : Ionicons.bookmark_outline,
                color: job.isSaved!
                    ? Styles.kPrimaryColor
                    : Styles.kSecondaryColor,
                onTap: () {
                  context.read<JobsBloc>().add(JobSave(id: freelance.id ?? ''));
                },
              );
            },
          ),
          CustomIconButton(
            icon: Ionicons.share,
            onTap: () {
              Share.share(
                'Offerta di lavoro per freelance: ${freelance.code}\n${freelance.projectDescription}',
                subject: freelance.code,
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
                            freelance.icon ?? '',
                            style: Styles.kBigTitle.copyWith(
                              color: Styles.kSecondaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          freelance.code ?? '',
                          style: Styles.kTitle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          freelance.date ?? '',
                          style: Styles.kSubtitle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            freelance.relationType!.isNotEmpty
                                ? CustomChip(
                                    icon: Ionicons.people,
                                    title: freelance.relationType ?? '',
                                    color: Styles.kSuccessColor,
                                  )
                                : const SizedBox.shrink(),
                            freelance.paymentTimes!.isNotEmpty
                                ? CustomChip(
                                    icon: Ionicons.cash,
                                    title: freelance.paymentTimes ?? '',
                                    color: Styles.kFlutterBlue,
                                  )
                                : const SizedBox.shrink(),
                            freelance.nda!.isNotEmpty
                                ? CustomChip(
                                    icon: Ionicons.briefcase,
                                    title: 'NDA: ${freelance.nda ?? ''}',
                                    color: Styles.kFlutterNavy,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text("Descrizione del progetto", style: Styles.kTitle),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            freelance.projectDescription ?? '',
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
