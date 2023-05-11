import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';

import 'package:job_app/features/aziende/presentation/cubit/filters/aziende_filter_cubit.dart';
import 'package:job_app/features/preferiti/presentation/cubit/annunci/preferiti_cubit.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../../app/presentation/widgets/certain_error.dart';
import '../../../../app/presentation/widgets/no_connection.dart';
import '../../domain/entities/annuncio_azienda.dart';
import '../cubit/annunci/aziende_cubit.dart';

import '../widgets/annunci_az_not_found.dart';
import '../widgets/aziende_search_bar.dart';
import '../widgets/horizontal_list_aziende.dart';
import '../widgets/horizontal_stats.dart';
import '../widgets/vertical_list_aziende.dart';
import '../widgets/vertical_stats.dart';

class AnnunciAziende extends StatefulWidget {
  AnnunciAziende({
    super.key,
  }) {
    initializeDateFormatting();
  }

  @override
  State<AnnunciAziende> createState() => _AnnunciAziendeState();
}

class _AnnunciAziendeState extends State<AnnunciAziende> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //ottengo le dimensioni del dispositivo:
    var mSize = MediaQuery.of(context).size;
    //salvo larghezza e altezza
    var mWidth = mSize.width; //Larghezza
    var mHeight = mSize.height; //Altezza
    var orientation = MediaQuery.of(context).orientation;
    var listaPreferiti = context.read<PreferitiCubit>().state.listaPreferiti;
    return BlocBuilder<AziendeCubit, AziendeState>(
      builder: (context, state) {
        switch (state.status) {
          case AziendeStateStatus.error:
            return CertainError(
              message: state.message!,
            );
          case AziendeStateStatus.noConnection:
            return const NoConnection();
          case AziendeStateStatus.serverFailure:
            return CertainError(
              message: state.message!,
            );
          case AziendeStateStatus.initial:
            if (state.listaAnnunci.isEmpty) {
              return Center(
                  child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  spinnerMode: true,
                  customColors: CustomSliderColors(
                      dotColor: Colors.transparent,
                      trackColor: Colors.transparent,
                      dynamicGradient: true,
                      progressBarColors: [
                        Colors.black,
                        Colors.blueGrey.harmonizeWith(
                            Theme.of(context).colorScheme.background),
                      ]),
                ),
              ));
            } else {
              return const SizedBox.shrink();
            }

          case AziendeStateStatus.loaded:
            if (orientation == Orientation.landscape) {
              return SingleChildScrollView(
                child: Container(
                  // color: Colors.lime,
                  child: MainContent(
                    orientation: orientation,
                    mWidth: mWidth,
                    mHeight: mHeight,
                    lista: state.listaAnnunci,
                    listaPreferiti: listaPreferiti,
                  ),
                ),
              );
            } else {
              return Container(
                // color: Colors.lime,
                child: MainContent(
                  orientation: orientation,
                  mWidth: mWidth,
                  mHeight: mHeight,
                  lista: state.listaAnnunci,
                  listaPreferiti: listaPreferiti,
                ),
              );
            }
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent(
      {super.key,
      required this.orientation,
      required this.mWidth,
      required this.mHeight,
      required this.listaPreferiti,
      required this.lista});

  final Orientation orientation;
  final double mWidth;
  final double mHeight;
  final List<AnnuncioAzienda> lista;
  final ListaPreferiti listaPreferiti;

  @override
  Widget build(BuildContext context) {
    for (var annuncio in lista) {
      int index = listaPreferiti
          .indexWhere((element) => element.annuncioId == annuncio.id);
      if (index != -1) {
        int indexToUpdate =
            lista.indexWhere((element) => element.id == annuncio.id);
        if (indexToUpdate != -1) {
          lista[indexToUpdate] = annuncio.copyWith(preferito: true);
        }
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const AziendeSearchBar(),
        if (lista.isEmpty) const AnnunciAzNotFound(),
        if (lista.isNotEmpty)
          Container(
            // color: Colors.pink,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (orientation == Orientation.portrait)
                  VerticalStats(
                    mWidth: mWidth,
                    mHeight: mHeight,
                  )
                else
                  HorizontalStats(
                    mWidth: mWidth,
                    mHeigth: mHeight,
                  ),
                if (lista.isNotEmpty && orientation == Orientation.landscape)
                  BlocBuilder<AziendeFilterCubit, AziendeFilterState>(
                    builder: (context, state) => HorizontalList(
                      mHeigth: mHeight,
                      listaAnnunci: lista,
                      params: state.paramsFromState,
                    ),
                  ),
              ],
            ),
          ),
        if (lista.isNotEmpty)
          const SizedBox(
            height: 8,
          ),
        if (lista.isNotEmpty && orientation == Orientation.portrait)
          BlocBuilder<AziendeFilterCubit, AziendeFilterState>(
            builder: (context, state) {
              return VerticalList(
                mHeigth: mHeight,
                listaAnnunci: lista,
                params: state.paramsFromState,
              );
            },
          ),
      ],
    );
  }
}
