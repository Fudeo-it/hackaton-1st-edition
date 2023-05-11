import 'package:flutter/material.dart';

import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/features/aziende/presentation/widgets/horizontal_list_aziende.dart';

import '../../../freelancers/presentation/widgets/horizontal_list_freelancers.dart';

class HorizontalListPreferiti extends StatefulWidget {
  const HorizontalListPreferiti({
    super.key,
    required this.mHeigth,
    required this.listaPreferiti,
  });
  final double mHeigth;
  final ListaPreferiti listaPreferiti;

  @override
  State<HorizontalListPreferiti> createState() =>
      _HorizontalListPreferitiState();
}

class _HorizontalListPreferitiState extends State<HorizontalListPreferiti> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 0.45 * widget.mHeigth,
      // color: Colors.purple,
      child: Scrollbar(
        scrollbarOrientation: ScrollbarOrientation.top,
        child: ListView.builder(
          controller: _scrollController,
          // key: const PageStorageKey<String>("Aziende hor"),

          itemCount: widget.listaPreferiti.length, //+ 1 per il bottomLoader

          itemBuilder: (context, index) => SizedBox(
            // height: 140,
            child: Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: SizedBox(
                width: 350,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: widget.listaPreferiti[index].isAzienda
                      ? CardAziendaHor(
                          annuncio:
                              widget.listaPreferiti[index].annuncioAzienda!,
                          isFromPreferiti: true,
                        )
                      : CardFreelancersHor(
                          annuncio:
                              widget.listaPreferiti[index].annuncioFreelancers!,
                          isFromPreferiti: true,
                        ),
                ),
              ),
            ),
          ),
          scrollDirection: Axis.horizontal,
        ),
      ),
    ));
  }
}
