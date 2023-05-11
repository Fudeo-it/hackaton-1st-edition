import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter/blocs/freelance_project/freelance_project_bloc.dart';
import 'package:offertelavoroflutter/cubits/device_cubit.dart';
import 'package:offertelavoroflutter/cubits/selected_freelance_project_cubit.dart';
import 'package:offertelavoroflutter/extension/date_time_extension.dart';
import 'package:offertelavoroflutter/models/formatted_text.dart';
import 'package:offertelavoroflutter/models/freelance_project.dart';
import 'package:offertelavoroflutter/services/share_service.dart';
import 'package:offertelavoroflutter/services/utils.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';
import 'package:offertelavoroflutter/widgets/courtesy_widget.dart';
import 'package:offertelavoroflutter/widgets/details_announcement_page/icon_title_widget.dart';

class DetailsFreelanceProjectPage extends StatelessWidget {
  static const route = '/job/freelance_project/details';

  const DetailsFreelanceProjectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SelectedFreelanceProjectCubit, FreelanceProject?>(
        builder: (context, freelanceProject) {
          if (freelanceProject != null) {
            return Scaffold(
              appBar: _appBar(
                context,
                freelanceProject: freelanceProject,
              ),
              body: _body(
                context,
                freelanceProject: freelanceProject,
              ),
            );
          }
          return _noSelectedBody(context);
        },
      );

  Widget _body(
    BuildContext context, {
    required FreelanceProject freelanceProject,
  }) =>
      BlocBuilder<DeviceCubit, DeviceType>(
        builder: (context, deviceType) {
          return GestureDetector(
            onTap: deviceType == DeviceType.table
                ? () => Navigator.of(context).pushNamed(route)
                : null,
            child: Stack(
              children: [
                _freelanceProject(
                  context,
                  freelanceProject: freelanceProject,
                ),
                _applyNowButton(
                  context,
                  howToAppy: freelanceProject.howToApply,
                  freelanceProjectTitle: freelanceProject.title,
                )
              ],
            ),
          );
        },
      );

  Widget _applyNowButton(
    BuildContext context, {
    required FormattedText howToAppy,
    required String freelanceProjectTitle,
  }) =>
      Positioned(
        bottom: 15,
        right: 36,
        left: 36,
        child: FilledButton(
          onPressed: () => Utils.jobApplyNow(
            context,
            formattedText: howToAppy,
            emailSubject: freelanceProjectTitle,
          ),
          child: const Text(
            'Candidati ora',
          ),
        ),
      );

  Widget _freelanceProject(
    BuildContext context, {
    required FreelanceProject freelanceProject,
  }) =>
      ListView(
        padding: const EdgeInsets.symmetric(
          vertical: MyInsets.scaffoldVerticalPadding,
          horizontal: MyInsets.scaffoldHorizonatalPadding,
        ),
        children: [
          _title(
            context,
            title: freelanceProject.title,
          ),
          _timing(
            context,
            timing: freelanceProject.timing,
          ),
          _jobRequest(
            context,
            jobRequest: freelanceProject.jobRequest,
          ),
          _budget(
            context,
            budget: freelanceProject.budget,
          ),
          _paymentTimes(
            context,
            paymentTimes: freelanceProject.paymentTimes,
          ),
          if (freelanceProject.typeRelationship != null)
            _typeRelationship(
              context,
              typeRelationship: freelanceProject.typeRelationship.toString(),
            ),
          if (freelanceProject.nda != null)
            _nda(
              context,
              nda: freelanceProject.nda!,
            ),
          _jobPosted(
            context,
            date: freelanceProject.postedOn.formatted,
          ),
          _description(
            context,
            descriptions: freelanceProject.description,
          ),
          const SizedBox(
            height: 52,
          ),
        ],
      );

  Widget _title(
    BuildContext context, {
    required String title,
  }) =>
      Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      );

  Widget _jobRequest(
    BuildContext context, {
    required List<FormattedText> jobRequest,
  }) =>
      IconTitleWidget(
        title: 'Richiesta di lavoro',
        icon: FontAwesomeIcons.fileCircleCheck,
        subTitle: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
            children: jobRequest
                .map(
                  (e) => TextSpan(
                    text: e.text,
                    style: TextStyle(
                      fontWeight: e.fontWeight,
                      fontStyle: e.fontStyle,
                      decoration: e.decoration,
                    ),
                  ),
                )
                .toList(growable: false),
          ),
        ),
      );

  Widget _budget(
    BuildContext context, {
    required String budget,
  }) =>
      IconTitleWidget(
        icon: FontAwesomeIcons.dollarSign,
        subTitle: budget,
        title: 'Budget',
      );

  Widget _paymentTimes(
    BuildContext context, {
    required String paymentTimes,
  }) =>
      IconTitleWidget(
        icon: FontAwesomeIcons.businessTime,
        subTitle: paymentTimes,
        title: 'Tempistiche di pagamento',
      );

  Widget _typeRelationship(
    BuildContext context, {
    required String typeRelationship,
  }) =>
      IconTitleWidget(
        icon: FontAwesomeIcons.users,
        subTitle: typeRelationship,
        title: 'Tipo di relazione',
      );

  Widget _timing(
    BuildContext context, {
    required String timing,
  }) =>
      IconTitleWidget(
        icon: FontAwesomeIcons.clock,
        subTitle: timing,
        title: 'Tempistiche',
      );

  Widget _nda(
    BuildContext context, {
    required Nda nda,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: MyInsets.s),
        child: IconTitleWidget(
          icon: FontAwesomeIcons.lock,
          subTitle: nda.toString(),
          title: 'Accordo di non divulgazione (NDA)',
        ),
      );

  Widget _jobPosted(
    BuildContext context, {
    required String date,
  }) =>
      IconTitleWidget(
        icon: FontAwesomeIcons.calendar,
        subTitle: date,
        title: 'Pubblicato il',
      );

  Widget _description(
    BuildContext context, {
    required List<FormattedText> descriptions,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: MyInsets.l),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall,
            children: descriptions
                .map(
                  (e) => TextSpan(
                    text: e.text,
                    style: TextStyle(
                      fontWeight: e.fontWeight,
                      fontStyle: e.fontStyle,
                      decoration: e.decoration,
                    ),
                  ),
                )
                .toList(growable: false),
          ),
        ),
      );

  PreferredSizeWidget _appBar(
    BuildContext context, {
    required FreelanceProject freelanceProject,
  }) =>
      AppBar(
        title: const Text('Progetto'),
        actions: [
          IconButton(
            onPressed: () => ShareService.share(
              freelanceProject.url,
              subject: freelanceProject.title,
            ),
            icon: Icon(
              Icons.share,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          IconButton(
            onPressed: () {
              context
                  .read<FreelanceProjectBloc>()
                  .toogleFavoriteFreelanceProject(
                    id: freelanceProject.id,
                  );
              context.read<SelectedFreelanceProjectCubit>().select(
                    freelanceProject.copyWith(
                      favorite: !freelanceProject.favorite,
                    ),
                  );
            },
            icon: Icon(
              freelanceProject.favorite
                  ? FontAwesomeIcons.solidBookmark
                  : FontAwesomeIcons.bookmark,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      );

  Widget _noSelectedBody(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const CourtesyWidget(
          title: 'Nessun progetto selezionato',
          icon: FontAwesomeIcons.faceFrownOpen,
        ),
      );
}
