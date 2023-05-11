import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/animated_toggle.dart';
import 'package:fudeo_hackaton/theme/theme.dart';

class OpportunityTypeToggle extends StatelessWidget {
  const OpportunityTypeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: BlocBuilder<OpportunityListBloc, OpportunityListState>(
          bloc: context.read<OpportunityListBloc>(),
          builder: (context, state) {
            return AnimatedToggle(
              values: const ['Assunzioni', 'Freelance'],
              backgroundColor: AppColors.white,
              textColor: AppColors.black,
              buttonColor: AppColors.grey,
              onToggleCallback: (_) =>
                  BlocProvider.of<OpportunityListBloc>(context)
                      .add(OpportunityToggleTap()),
            );
          },
        ),
      ),
    );
  }
}

class ToggleItem extends StatelessWidget {
  const ToggleItem({
    super.key,
    required OpportunityType selectedType,
    required OpportunityType activeWhen,
    required String label,
  })  : _activeWhen = activeWhen,
        _label = label,
        _selectedType = selectedType;

  final OpportunityType _selectedType;
  final OpportunityType _activeWhen;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<OpportunityListBloc>(context)
          .add(OpportunityToggleTap()),
      child: Text(
        _label,
        style: _selectedType == _activeWhen
            ? AppFonts.jobListToggleActive
            : AppFonts.jobListToggle,
      ),
    );
  }
}
