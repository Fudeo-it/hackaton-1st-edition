import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:offertelavoroflutter/blocs/blocs.dart';
import 'package:offertelavoroflutter/cubits/cubits.dart';
import 'package:offertelavoroflutter/misc/misc.dart';
import 'package:offertelavoroflutter/styles.dart';
import 'package:offertelavoroflutter/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            "Offerte di lavoro",
            style: Styles.kTitle,
          ),
          actions: [
            CustomIconButton(
              icon: Ionicons.link,
              color: Styles.kPrimaryColor,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: Styles.kRoundedRectangleBorder,
                      child: Padding(
                        padding: Styles.kPaddingAll,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Sei in cerca di uno sviluppatore Flutter?",
                              style: Styles.kSubtitle,
                              textAlign: TextAlign.center,
                            ),
                            CustomTextButton(
                              title: "Per assumerlo in un'azienda",
                              onPressed: () {
                                Misc.openUrl(Uri.parse(
                                    'https://offertelavoroflutter.it/pubblica-offerta-lavoro-flutter'));
                              },
                            ),
                            CustomTextButton(
                              title: "Per un progetto freelance",
                              onPressed: () {
                                Misc.openUrl(Uri.parse(
                                    'https://offertelavoroflutter.it/pubblica-progetto-freelance'));
                              },
                            ),
                            Text(
                              "Sei uno sviluppatore Flutter?",
                              style: Styles.kSubtitle,
                              textAlign: TextAlign.center,
                            ),
                            CustomTextButton(
                              title: "In cerca di lavoro",
                              onPressed: () {
                                Misc.openUrl(Uri.parse(
                                    'https://offertelavoroflutter.it/ricevi-offerte-lavoro-flutter'));
                              },
                            ),
                            CustomTextButton(
                              title: "In cerca di progetti freelance",
                              onPressed: () {
                                Misc.openUrl(Uri.parse(
                                    'https://offertelavoroflutter.it/ricevi-progetti-flutter-freelance'));
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              title: "Chiudi",
                              onTap: () => context.pop(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Styles.kPrimaryColor,
            labelStyle: Styles.kBody,
            labelColor: Styles.kTextColor,
            unselectedLabelStyle: Styles.kBody,
            unselectedLabelColor: Styles.kSecondaryColor,
            tabs: const [
              Tab(
                text: "Assunzioni",
              ),
              Tab(
                text: "Freelance",
              ),
            ],
          ),
        ),
        body: BlocConsumer<JobsBloc, JobsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: state.status == JobsStatus.loading
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Caricamento dei dati...",
                            style: Styles.kSubtitle,
                          ),
                          const SizedBox(height: 10),
                          const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Styles.kPrimaryColor,
                            ),
                            strokeWidth: 2,
                          ),
                        ],
                      ),
                    )
                  : TabBarView(
                      children: [
                        state.recruitment.isEmpty
                            ? const CustomEmptyView()
                            : Padding(
                                padding: Styles.kPaddingH,
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      BlocBuilder<FiltersCubit, FiltersState>(
                                        builder: (context, state) {
                                          return state != const FiltersState()
                                              ? CustomTextButton(
                                                  title: "Filtri attivi",
                                                  onPressed: () {
                                                    context.go('/filters');
                                                  },
                                                )
                                              : const SizedBox.shrink();
                                        },
                                      ),
                                      ListView.separated(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: state.recruitment.length,
                                        separatorBuilder: (context, index) =>
                                            const Divider(
                                          color: Styles.kSecondaryColor,
                                        ),
                                        itemBuilder: (context, index) {
                                          final recruitment =
                                              state.recruitment[index];
                                          return CustomRecruitmentTile(
                                            recruitment: recruitment,
                                            onTap: () {
                                              context.push(
                                                '/recruitment',
                                                extra: recruitment,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        state.freelance.isEmpty
                            ? const CustomEmptyView()
                            : Padding(
                                padding: Styles.kPaddingH,
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      BlocBuilder<FiltersCubit, FiltersState>(
                                        builder: (context, state) {
                                          return state != const FiltersState()
                                              ? CustomTextButton(
                                                  title: "Filtri attivi",
                                                  onPressed: () {
                                                    context.go('/filters');
                                                  },
                                                )
                                              : const SizedBox.shrink();
                                        },
                                      ),
                                      ListView.separated(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: state.freelance.length,
                                        separatorBuilder: (context, index) =>
                                            const Divider(
                                          color: Styles.kSecondaryColor,
                                        ),
                                        itemBuilder: (context, index) {
                                          final freelance =
                                              state.freelance[index];
                                          return CustomFreelanceTile(
                                            freelance: freelance,
                                            onTap: () {
                                              context.push(
                                                '/freelance',
                                                extra: freelance,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}

class CustomEmptyView extends StatelessWidget {
  const CustomEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Ionicons.cafe_outline,
            size: 50,
            color: Styles.kSecondaryColor,
          ),
          const SizedBox(height: 10),
          Text(
            "Oops! Nessuna offerta trovata",
            style: Styles.kSubtitle,
          ),
        ],
      ),
    );
  }
}
