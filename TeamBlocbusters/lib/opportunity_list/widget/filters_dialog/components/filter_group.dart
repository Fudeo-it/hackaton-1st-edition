import 'package:flutter/material.dart';
import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/filters_dialog/components/components.dart';
import 'package:fudeo_hackaton/theme/theme.dart';

class FilterGroup extends StatelessWidget {
  const FilterGroup({
    super.key,
    required this.title,
    required this.filters,
    required this.icon,
  });

  final String title;
  final List<Filter> filters;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: AppFonts.filtersDialogGroupTitle,
      ),
      leading: Icon(icon, color: AppColors.sky),
      tilePadding: EdgeInsets.zero,
      children: [
        ...filters.map(
          (filter) => FilterItem(
            filter: filter,
          ),
        ),
      ],
    );
  }
}
