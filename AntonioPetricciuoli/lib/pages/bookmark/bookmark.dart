import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:offertelavoroflutter/blocs/blocs.dart';
import 'package:offertelavoroflutter/models/recruitment.dart';
import 'package:offertelavoroflutter/styles.dart';
import 'package:offertelavoroflutter/widgets/widgets.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            "Salvati",
            style: Styles.kTitle,
          ),
          centerTitle: true,
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
        body: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            return SafeArea(
              child: TabBarView(
                children: [
                  Padding(
                    padding: Styles.kPaddingAll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: state.recruitment
                              .where((element) => element.isSaved!)
                              .length,
                          separatorBuilder: (context, index) => const Divider(
                            color: Styles.kSecondaryColor,
                          ),
                          itemBuilder: (context, index) {
                            final recruitment = state.recruitment
                                .where((element) => element.isSaved!)
                                .toList()[index];
                            return CustomRecruitmentTile(
                              recruitment: recruitment,
                              onTap: () {
                                context.push('/recruitment',
                                    extra: recruitment);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: Styles.kPaddingAll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: state.freelance
                              .where((element) => element.isSaved!)
                              .length,
                          separatorBuilder: (context, index) => const Divider(
                            color: Styles.kSecondaryColor,
                          ),
                          itemBuilder: (context, index) {
                            final freelance = state.freelance
                                .where((element) => element.isSaved!)
                                .toList()[index];
                            return CustomFreelanceTile(
                              freelance: freelance,
                              onTap: () {
                                context.push('/freelance', extra: freelance);
                              },
                            );
                          },
                        ),
                      ],
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
