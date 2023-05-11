import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/no_results/empty_filters.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:sized_context/sized_context.dart';

class NoResultsMessage extends StatelessWidget {
  const NoResultsMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final large = context.diagonalInches >= 7;
    final verticalPadding = large ? 48.0 : 24.0;

    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            child: SvgPicture.asset(
              'assets/no_result.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Column(
              children: const [
                Text(
                  'Non ci sono annunci corrispondenti alla tua ricerca!',
                  style: AppFonts.listNoResults,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                EmptyFilters(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
