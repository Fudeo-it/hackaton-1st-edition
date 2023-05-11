import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/center_circular_progress_indicator.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/content_sheet.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/error_indicator.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/filter_buttons.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer_filters/hiring_job_offer_filters.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/repositories/hiring_job_offer_repository.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/widgets/hiring_job_offer_filter_sheet/bloc/hiring_job_offer_filter_sheet_bloc.dart';

class HiringJobOfferFilterSheet extends StatelessWidget {
  final HiringJobOfferFilters initialFilters;
  const HiringJobOfferFilterSheet({Key? key, required this.initialFilters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HiringJobOfferFilterSheetBloc(
        hiringJobOfferRepository: RepositoryProvider.of<HiringJobOfferRepository>(context)
      )..add(HiringJobOfferFilterSheetEvent.initialized(initialFilters)),
      child: const _HiringJobOfferFilterView(),
    );
  }
}

class _HiringJobOfferFilterView extends StatelessWidget {
  const _HiringJobOfferFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
      child: BlocBuilder<HiringJobOfferFilterSheetBloc, HiringJobOfferFilterSheetState>(
        builder: (context, state) {
          switch(state.status) {
            case HiringJobOfferFilterSheetStatus.success:
              return _buildFilters(context, state);

            case HiringJobOfferFilterSheetStatus.error:
              return _buildError(context);

            default:
              return _buildLoading(context);
          }
        },
      )
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(AppLocalizations.of(context)!.advancedSearch, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 480,
          child: CenterCircularProgressIndicator(),
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(AppLocalizations.of(context)!.advancedSearch, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: 480,
          child: ErrorIndicator(
            onRetry: () => context.read<HiringJobOfferFilterSheetBloc>().add(const HiringJobOfferFilterSheetEvent.optionsRequested())
          ),
        ),
      ],
    );
  }

  Widget _buildFilters(BuildContext context, HiringJobOfferFilterSheetState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(AppLocalizations.of(context)!.advancedSearch, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 30),

        Text(AppLocalizations.of(context)!.teamAttribute, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 10),
        _buildTeamFilters(state, context),
        const SizedBox(height: 20),

        Text(AppLocalizations.of(context)!.seniorityAttribute, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 10),
        _buildSeniorityFilters(state, context),
        const SizedBox(height: 20),

        Text(AppLocalizations.of(context)!.contrattoAttribute, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 10),
        _buildContrattoFilters(state, context),
        const SizedBox(height: 30),

        ElevatedButton(
          onPressed: () => context.read<HiringJobOfferFilterSheetBloc>()
            .add(const HiringJobOfferFilterSheetEvent.filtersCleared()),
          style: Styles.getLightButtonTheme(context),
          child: Text(AppLocalizations.of(context)!.removeFilters)
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(
              HiringJobOfferFilters(
                contratto: state.contrattoSelectedOptions,
                team: state.teamSelectedOptions,
                seniority: state.senioritySelectedOptions
              )
            );
          },
          style: Styles.getAccentButtonTheme(context),
          child: Text(AppLocalizations.of(context)!.applyFilters)
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTeamFilters(HiringJobOfferFilterSheetState state, BuildContext context) {
    return FilterButtons<String>(
      onSelected: (optionName) => context.read<HiringJobOfferFilterSheetBloc>()
        .add(HiringJobOfferFilterSheetEvent.teamOptionToggled(optionName)),
      selectedOptionsValues: state.teamSelectedOptions,
      options: state.teamOptions?.map((option) => FilterButtonsOption(option.name, option.name)).toList(),
    );
  }

  Widget _buildSeniorityFilters(HiringJobOfferFilterSheetState state, BuildContext context) {
    return FilterButtons<String>(
      onSelected: (optionName) => context.read<HiringJobOfferFilterSheetBloc>()
        .add(HiringJobOfferFilterSheetEvent.seniorityOptionToggled(optionName)),
      selectedOptionsValues: state.senioritySelectedOptions,
      options: state.seniorityOptions?.map((option) => FilterButtonsOption(option.name, option.name)).toList(),
    );
  }

  Widget _buildContrattoFilters(HiringJobOfferFilterSheetState state, BuildContext context) {
    return FilterButtons<String>(
      onSelected: (optionName) => context.read<HiringJobOfferFilterSheetBloc>()
        .add(HiringJobOfferFilterSheetEvent.contrattoOptionToggled(optionName)),
      selectedOptionsValues: state.contrattoSelectedOptions,
      options: state.contrattoOptions?.map((option) => FilterButtonsOption(option.name, option.name)).toList(),
    );
  }
}

