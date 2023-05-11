import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/filters_dialog/components/components.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: SearchBar()),
              const SizedBox(width: 16),
              BlocBuilder<OpportunityListBloc, OpportunityListState>(
                builder: (context, state) {
                  return Visibility(
                    visible: state.selectedType == OpportunityType.jobOffer,
                    child: Stack(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.ultraLightGrey,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: IconButton(
                            onPressed: () =>
                                BlocProvider.of<OpportunityListBloc>(context)
                                    .add(OpportunityFilterTap()),
                            icon: Icon(
                              PhosphorIcons.regular.slidersHorizontal,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: state.filter.filters.isNotEmpty,
                          child: Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.accent,
                              ),
                              width: 8,
                              height: 8,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          const ActiveFilters(),
        ],
      ),
    );
  }
}
