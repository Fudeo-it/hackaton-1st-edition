import 'package:flutter/material.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/annuncio.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/container_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/filter_badge.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/row_info_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/utils.dart' as mutils;

class AnnuncioRow extends StatelessWidget {
  const AnnuncioRow({super.key, required this.annuncio});

  final Annuncio annuncio;

  @override
  Widget build(BuildContext context) {
    return ContainerRow(
      route: '/annuncio/single',
      entity: annuncio,
      child: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            annuncio.title,
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
            label: annuncio.aziendaName,
            icon: Icons.domain,
            isWithIcon: true,
          ),
          RowInfoRow(
            label: annuncio.localita,
            isWithIcon: true,
            icon: Icons.location_on,
          ),
          RowInfoRow(
            label: mutils.formatDatetimeToDisplay(
                annuncio.createdTime, "d MMMM yyyy"),
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
              FilterBadge(
                color: annuncio.teamColor,
                label: annuncio.teamName,
              ),
              if (annuncio.contrattoName.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: FilterBadge(
                    color: annuncio.contrattoColor,
                    label: annuncio.contrattoName,
                  ),
                ),
              if (annuncio.seniorityName.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: FilterBadge(
                    color: annuncio.seniorityColor,
                    label: annuncio.seniorityName,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
