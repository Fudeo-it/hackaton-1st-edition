import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/filters_dialog/components/components.dart';
import 'package:fudeo_hackaton/theme/theme.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({super.key, required Filter filter}) : _filter = filter;

  final Filter _filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            stringFromFilter(_filter),
            style: AppFonts.filtersDialogItem,
          ),
          BlocBuilder<OpportunityListBloc, OpportunityListState>(
            builder: (context, state) {
              return SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: state.filterToApply.filters.contains(_filter),
                  onChanged: (_) =>
                      BlocProvider.of<OpportunityListBloc>(context)
                          .add(FilterTap(_filter)),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
