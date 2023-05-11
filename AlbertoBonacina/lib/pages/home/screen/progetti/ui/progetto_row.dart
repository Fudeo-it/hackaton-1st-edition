import 'package:flutter/material.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/progetto.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/container_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/filter_badge.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/row_info_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/utils.dart' as mutils;

class ProgettoRow extends StatelessWidget {
  const ProgettoRow({super.key, required this.progetto});

  final Progetto progetto;

  @override
  Widget build(BuildContext context) {
    return ContainerRow(
      route: '/progetto/single',
      entity: progetto,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            progetto.title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 4,
          ),
          RowInfoRow(
            label: mutils.formatDatetimeToDisplay(
                progetto.createdTime, "d MMMM yyyy"),
            icon: Icons.schedule_outlined,
            isWithIcon: true,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (progetto.tipoRelazioneName.isNotEmpty)
                FilterBadge(
                  color: progetto.tipoRelazioneColor,
                  label: progetto.tipoRelazioneName,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
