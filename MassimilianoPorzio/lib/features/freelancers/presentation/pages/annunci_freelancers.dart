import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:job_app/app/presentation/widgets/certain_error.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/features/freelancers/domain/entities/annuncio_freelancer.dart';
import 'package:job_app/features/freelancers/presentation/cubit/annunci/freelancers_cubit.dart';
import 'package:job_app/features/freelancers/presentation/widgets/horizontal_list_freelancers.dart';
import 'package:job_app/features/freelancers/presentation/widgets/horizontal_stats_freelancers.dart';
import 'package:job_app/features/freelancers/presentation/widgets/vertical_list_freelancers.dart';
import 'package:job_app/features/freelancers/presentation/widgets/vertical_stats_freelancers.dart';
import 'package:job_app/features/preferiti/presentation/cubit/annunci/preferiti_cubit.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../../app/presentation/widgets/no_connection.dart';

import '../cubit/filters/freelancers_filters_cubit.dart';
import '../widgets/annunci_freelancers_not_found.dart';
import '../widgets/freelancers_search_bar.dart';

class AnnunciFreelancersWidget extends StatefulWidget {
  AnnunciFreelancersWidget({
    super.key,
  }) {
    initializeDateFormatting();
  }

  @override
  State<AnnunciFreelancersWidget> createState() =>
      _AnnunciFreelancersWidgetState();
}

class _AnnunciFreelancersWidgetState extends State<AnnunciFreelancersWidget> {
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
    return BlocBuilder<FreelancersCubit, FreelancersState>(
      builder: (context, state) {
        switch (state.status) {
          case FreelancersStateStatus.error:
            return CertainError(
              message: state.message!,
            );
          case FreelancersStateStatus.noConnection:
            return const NoConnection();
          case FreelancersStateStatus.serverFailure:
            return CertainError(
              message: state.message!,
            );
          case FreelancersStateStatus.initial:
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

          case FreelancersStateStatus.loaded:
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
                      lista: state.listaAnnunci,
                      listaPreferiti: listaPreferiti,
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
  final List<AnnuncioFreelancers> lista;
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
        const FreelancersSearchBar(),
        if (lista.isEmpty) const AnnunciFreelancersNotFound(),
        if (lista.isNotEmpty)
          Container(
            // color: Colors.pink,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (orientation == Orientation.portrait)
                  VerticalStatsFreelancers(
                    mWidth: mWidth,
                    mHeight: mHeight,
                  )
                else
                  HorizontalStatsFreelancers(
                    mWidth: mWidth,
                    mHeigth: mHeight,
                  ),
                if (lista.isNotEmpty && orientation == Orientation.landscape)
                  BlocBuilder<FreelancersFiltersCubit, FreelancersFiltersState>(
                    builder: (context, state) => HorizontalListFreelancers(
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
          BlocBuilder<FreelancersFiltersCubit, FreelancersFiltersState>(
            builder: (context, state) {
              return VerticalListFreelancers(
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
