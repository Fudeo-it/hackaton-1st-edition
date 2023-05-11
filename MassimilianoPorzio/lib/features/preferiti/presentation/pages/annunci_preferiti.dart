import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:job_app/app/presentation/widgets/certain_error.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';

import 'package:job_app/features/preferiti/presentation/cubit/annunci/preferiti_cubit.dart';
import 'package:job_app/features/preferiti/presentation/widgets/horizontal_list_preferiti.dart';
import 'package:job_app/features/preferiti/presentation/widgets/horizontal_stats_freelancers.dart';
import 'package:job_app/features/preferiti/presentation/widgets/vertical_list_preferiti.dart';
import 'package:job_app/features/preferiti/presentation/widgets/vertical_stats_preferiti.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../cubit/filters/preferiti_filters_cubit.dart';
import '../widgets/preferiti_not_found.dart';
import '../widgets/preferiti_search_bar.dart';

class AnnunciPreferitiWidget extends StatefulWidget {
  AnnunciPreferitiWidget({
    super.key,
  }) {
    initializeDateFormatting();
  }

  @override
  State<AnnunciPreferitiWidget> createState() => _AnnunciPreferitiWidgetState();
}

class _AnnunciPreferitiWidgetState extends State<AnnunciPreferitiWidget> {
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
    return BlocBuilder<PreferitiCubit, PreferitiState>(
      builder: (context, state) {
        switch (state.status) {
          case PreferitiStatus.error:
            return CertainError(
              message: state.message!,
            );

          case PreferitiStatus.loading:
            if (state.listaPreferiti.isEmpty) {
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

          case PreferitiStatus.loaded:
            if (orientation == Orientation.landscape) {
              return Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  child: Container(
                    // color: Colors.lime,
                    child: MainContent(
                      orientation: orientation,
                      mWidth: mWidth,
                      mHeight: mHeight,
                      lista: state.listaPreferiti,
                    ),
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
                  lista: state.listaPreferiti,
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
  const MainContent({
    super.key,
    required this.orientation,
    required this.mWidth,
    required this.mHeight,
    required this.lista,
  });

  final Orientation orientation;
  final double mWidth;
  final double mHeight;

  final ListaPreferiti lista;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const PreferitiSearchBar(),
        if (lista.isEmpty) const PreferitiNotFound(),
        if (lista.isNotEmpty)
          Container(
            // color: Colors.pink,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (orientation == Orientation.portrait)
                  VerticalStatsPreferiti(
                    mWidth: mWidth,
                    mHeight: mHeight,
                  )
                else
                  HorizontalStatsPreferiti(
                    mWidth: mWidth,
                    mHeigth: mHeight,
                  ),
                if (lista.isNotEmpty && orientation == Orientation.landscape)
                  BlocBuilder<PreferitiFiltersCubit, PreferitiFiltersState>(
                    builder: (context, state) => HorizontalListPreferiti(
                      mHeigth: mHeight,
                      listaPreferiti: lista,
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
          VerticalListPreferiti(
            mHeigth: mHeight,
            listaPreferiti: lista,
          ),
      ],
    );
  }
}
