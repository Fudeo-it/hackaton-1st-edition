import 'package:annunci_lavoro_flutter/blocs/jobAds/bloc/job_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';
import 'package:annunci_lavoro_flutter/widgets/buttons/sort_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SortingModalBottomSheet extends StatefulWidget {
  ///
  /// bottomdSheet che contiene i [SortButtons] per i criteri di ordinamento.
  ///
  const SortingModalBottomSheet({super.key});

  @override
  State<SortingModalBottomSheet> createState() =>
      _SortingModalBottomSheetState();
}

class _SortingModalBottomSheetState extends State<SortingModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Stack(
        children: [
          _topPills(),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ordina annunci',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    _resetButton(),
                  ],
                ),
                const Divider(color: Colors.grey, thickness: 2),
                SortButtons(
                    title: 'JobPosted',
                    icon: FontAwesomeIcons.clock,
                    buttons: const ['+ recente', '- Recente'],
                    attributeGetter: (JobPosition jobPosition) =>
                        jobPosition.postedDate),
                SortButtons(
                    title: 'Retribuzione',
                    icon: FontAwesomeIcons.clock,
                    buttons: const ['Crescente', 'Decrescente'],
                    attributeGetter: (JobPosition jobPosition) =>
                        jobPosition.remuneration),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// metodo che resetta i cirteri di ricerca svuotando la lista sort del controller.
  Widget _resetButton() => TextButton(
        onPressed: () {
          BlocProvider.of<JobAdsBloc>(context).jobAdsController.resetSort();
          setState(() {});
        },
        child: Text(
          'Reset',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      );

  Widget _topPills() => Positioned(
        top: 10,
        left: MediaQuery.of(context).size.width / 2 - 30,
        right: MediaQuery.of(context).size.width / 2 - 30,
        child: Container(
          width: 100,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
}
