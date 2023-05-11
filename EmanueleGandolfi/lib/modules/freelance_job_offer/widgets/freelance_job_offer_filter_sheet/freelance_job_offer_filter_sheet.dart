import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/center_circular_progress_indicator.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/content_sheet.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/error_indicator.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/filter_buttons.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer_filters/freelance_job_offer_filters.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/repositories/freelance_job_offer_repository.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/freelance_job_offer_filter_sheet/bloc/freelance_job_offer_filter_sheet_bloc.dart';

class FreelanceJobOfferFilterSheet extends StatelessWidget {
  final FreelanceJobOfferFilters initialFilters;
  const FreelanceJobOfferFilterSheet({Key? key, required this.initialFilters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FreelanceJobOfferFilterSheetBloc(
        freelanceJobOfferRepository: RepositoryProvider.of<FreelanceJobOfferRepository>(context)
      )..add(FreelanceJobOfferFilterSheetEvent.initialized(initialFilters)),
      child: const _FreelanceJobOfferFilterView(),
    );
  }
}

class _FreelanceJobOfferFilterView extends StatelessWidget {
  const _FreelanceJobOfferFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
      child: BlocBuilder<FreelanceJobOfferFilterSheetBloc, FreelanceJobOfferFilterSheetState>(
        builder: (context, state) {
          switch(state.status) {
            case FreelanceJobOfferFilterSheetStatus.success:
              return _buildFilters(context, state);

            case FreelanceJobOfferFilterSheetStatus.error:
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
          height: 380,
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
          height: 380,
          child: ErrorIndicator(
            onRetry: () => context.read<FreelanceJobOfferFilterSheetBloc>().add(const FreelanceJobOfferFilterSheetEvent.optionsRequested())
          ),
        ),
      ],
    );
  }

  Widget _buildFilters(BuildContext context, FreelanceJobOfferFilterSheetState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(AppLocalizations.of(context)!.advancedSearch, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 30),

        Text(AppLocalizations.of(context)!.ndaAttribute, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 10),
        _buildNdaFilters(state, context),
        const SizedBox(height: 20),

        Text(AppLocalizations.of(context)!.tipoDiRelazioneAttribute, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 10),
        _buildTipoDiRelazioneFilters(state, context),
        const SizedBox(height: 30),

        ElevatedButton(
          onPressed: () => context.read<FreelanceJobOfferFilterSheetBloc>()
            .add(const FreelanceJobOfferFilterSheetEvent.filtersCleared()),
          style: Styles.getLightButtonTheme(context),
          child: Text(AppLocalizations.of(context)!.removeFilters)
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(
              FreelanceJobOfferFilters(
                nda: state.ndaSelectedOptions,
                tipoDiRelazione: state.tipoDiRelazioneSelectedOptions,
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

  Widget _buildNdaFilters(FreelanceJobOfferFilterSheetState state, BuildContext context) {
    return FilterButtons<String>(
      optionsPerRow: 2,
      onSelected: (optionName) => context.read<FreelanceJobOfferFilterSheetBloc>()
        .add(FreelanceJobOfferFilterSheetEvent.ndaOptionToggled(optionName)),
      selectedOptionsValues: state.ndaSelectedOptions,
      options: state.ndaOptions?.map((option) => FilterButtonsOption(option.name, option.name)).toList(),
    );
  }

  Widget _buildTipoDiRelazioneFilters(FreelanceJobOfferFilterSheetState state, BuildContext context) {
    return FilterButtons<String>(
      optionsPerRow: 2,
      onSelected: (optionName) => context.read<FreelanceJobOfferFilterSheetBloc>()
        .add(FreelanceJobOfferFilterSheetEvent.tipoDiRelazioneOptionToggled(optionName)),
      selectedOptionsValues: state.tipoDiRelazioneSelectedOptions,
      options: state.tipoDiRelazioneOptions?.map((option) => FilterButtonsOption(option.name, option.name)).toList(),
    );
  }
}

