import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';
import 'package:fudeo_hackaton/theme/theme.dart';

class EmptyFilters extends StatelessWidget {
  const EmptyFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text(
        'Elimina filtri',
        style: AppFonts.listEmptyFilters,
      ),
      onTap: () => BlocProvider.of<OpportunityListBloc>(context).add(
        EmptyFilterTap(),
      ),
    );
  }
}
