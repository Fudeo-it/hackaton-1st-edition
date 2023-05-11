import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter/blocs/freelance_project/freelance_project_bloc.dart';
import 'package:offertelavoroflutter/cubits/favorite_mode_cubit.dart';
import 'package:offertelavoroflutter/models/freelance_project.dart';
import 'package:offertelavoroflutter/services/utils.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';
import 'package:offertelavoroflutter/widgets/courtesy_widget.dart';
import 'package:offertelavoroflutter/widgets/freelance_project_page/freelance_project_item.dart';
import 'package:offertelavoroflutter/widgets/loading/shimmer_list.dart';

class FreelanceProjectPage extends StatelessWidget {
  static const route = 'job/freelance_project';
  const FreelanceProjectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreelanceProjectBloc, FreelanceProjectState>(
      builder: (context, state) {
        if (state is FetchedFreelanceProjectState) {
          return _freelanceProjectsList(
            context,
            freelanceProjects: state.freelanceProjects,
          );
        } else if (state is NoFreelanceProjectState) {
          return _noFreelanceProject(context);
        } else if (state is ErrorFreelanceProjectState) {
          return _error(context, errorType: state.type);
        }
        return _loading();
      },
    );
  }

  Widget _freelanceProjectsList(
    BuildContext context, {
    required List<FreelanceProject> freelanceProjects,
  }) =>
      RefreshIndicator(
        onRefresh: () async {
          HapticFeedback.mediumImpact();
          context.read<FreelanceProjectBloc>().onFetch();
        },
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: MyInsets.scaffoldVerticalPadding,
            bottom: MyInsets.scaffoldBottomPaddingWithBubble,
            left: MyInsets.scaffoldHorizonatalPadding,
            right: MyInsets.scaffoldHorizonatalPadding,
          ),
          itemCount: freelanceProjects.length,
          itemBuilder: (builder, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: MyInsets.m),
            child: FreelanceProjectItem(
              freelanceProject: freelanceProjects[index],
            ),
          ),
        ),
      );

  Widget _noFreelanceProject(BuildContext context) =>
      BlocBuilder<FavoriteModeCubit, bool>(
        builder: (context, favoriteMode) {
          return CourtesyWidget(
            title: favoriteMode
                ? 'Nessun progetto salvato nei preferiti'
                : 'Nessun progetto disponibile',
            icon: FontAwesomeIcons.faceFrownOpen,
          );
        },
      );

  Widget _error(
    BuildContext context, {
    required ErrorType errorType,
  }) {
    switch (errorType) {
      case ErrorType.local:
        return CourtesyWidget.localError();
      case ErrorType.newtwork:
        return CourtesyWidget.networkError();
      case ErrorType.repository:
        return CourtesyWidget.repositoryError();
      case ErrorType.noConnectivity:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CourtesyWidget.noConnectivity(),
            TextButton(
              onPressed: () => context.read<FreelanceProjectBloc>().onFetch(),
              child: const Text(
                'Ricarica',
              ),
            ),
          ],
        );
    }
  }

  Widget _loading() => Padding(
        padding: const EdgeInsets.only(top: MyInsets.scaffoldVerticalPadding),
        child: ShimmerList(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: MyInsets.m),
            child: FreelanceProjectItem.shimmer(),
          ),
        ),
      );
}
