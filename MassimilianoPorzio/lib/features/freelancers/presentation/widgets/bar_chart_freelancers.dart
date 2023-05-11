/// Chart import
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/app/resources/color_manager.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/features/freelancers/domain/enums/relazione.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app/presentation/cubit/dark_mode/dark_mode_cubit.dart';
import '../../domain/enums/nda.dart';
import '../cubit/annunci/freelancers_cubit.dart';

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

enum ChartType {
  nda,
  relazione;
}

class StatBarChartsFreelancers extends StatefulWidget {
  const StatBarChartsFreelancers({
    Key? key,
    required this.listaAnnunci,
    required this.mode,
  }) : super(key: key);

  final AnnuncioFreelancerList listaAnnunci;
  final ThemeMode mode;

  @override
  State<StatBarChartsFreelancers> createState() =>
      _StatBarChartsFreelancersState();
}

class _StatBarChartsFreelancersState extends State<StatBarChartsFreelancers> {
  late Timer _timer;
  late ChartType _chart;
  Widget _myAnimatedWidget = const SizedBox.shrink();
  late List<ChartData> dataSiNDA;
  late List<ChartData> dataNoNDA;
  late List<ChartData> dataSoloRelazione;
  late List<ChartData> dataAltriRelazione;

  final Duration _myDuration = const Duration(seconds: 3);
  Map<String, int> conteggiNDA = {"No": 0, "Sì": 0}; //TODO con const
  Map<String, int> conteggiRelazione = {"Solo": 0, "Altri": 0};

  ChartType _nextChart(ChartType currentChart) {
    switch (currentChart) {
      case ChartType.nda:
        return ChartType.relazione;
      case ChartType.relazione:
        return ChartType.nda;

      default:
        return ChartType.nda;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      for (var annuncio in widget.listaAnnunci) {
        if (annuncio.nda != null) {
          if (annuncio.nda!.nda == NDA.no) {
            conteggiNDA["No"] = conteggiNDA["No"]! + 1;
          }
          if (annuncio.nda!.nda == NDA.si) {
            conteggiNDA["Sì"] = conteggiNDA["Sì"]! + 1;
          }
        } //fine conteggi su tipo NDA
        if (annuncio.relazione != null) {
          switch (annuncio.relazione!.relazione) {
            case Relazione.solo:
              conteggiRelazione["Solo"] = conteggiRelazione["Solo"]! + 1;
              break;
            case Relazione.altri:
              conteggiRelazione["Altri"] = conteggiRelazione["Altri"]! + 1;
              break;

            default:
          }
        } //fine conteggio tipo Relazione
      }
      dataSiNDA = [
        ChartData('NDA Sì', conteggiNDA["Sì"]!.toDouble()),
      ];
      dataNoNDA = [
        ChartData('NDA No', conteggiNDA["No"]!.toDouble()),
      ];

      dataSoloRelazione = [
        ChartData('Solo committ.', conteggiRelazione["Solo"]!.toDouble()),
      ];
      dataAltriRelazione = [
        ChartData('Altri profess.', conteggiRelazione["Altri"]!.toDouble()),
      ];

      _chart = ChartType.nda;
      setState(() {
        _myAnimatedWidget = Animate(
          effects: const [
            FadeEffect(),
            // ScaleEffect(),
          ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "...calcolo statistiche",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onTertiary),
              ),
            ],
          ),
        );
      });
    });

    _timer = Timer.periodic(_myDuration, (_) {
      conteggiNDA = {"No": 0, "Sì": 0}; //TODO con const
      conteggiRelazione = {"Solo": 0, "Altri": 0};
      for (var annuncio in widget.listaAnnunci) {
        if (annuncio.nda != null) {
          if (annuncio.nda!.nda == NDA.no) {
            conteggiNDA["No"] = conteggiNDA["No"]! + 1;
          }
          if (annuncio.nda!.nda == NDA.si) {
            conteggiNDA["Sì"] = conteggiNDA["Sì"]! + 1;
          }
        } //fine conteggi su tipo NDA
        if (annuncio.relazione != null) {
          switch (annuncio.relazione!.relazione) {
            case Relazione.solo:
              conteggiRelazione["Solo"] = conteggiRelazione["Solo"]! + 1;
              break;
            case Relazione.altri:
              conteggiRelazione["Altri"] = conteggiRelazione["Altri"]! + 1;
              break;

            default:
          }
        } //fine conteggio tipo Relazione
      }
      setState(() {
        //* RIFACCIO IL CALCOLO CON I DATI CHE OTTENGO (nel frattempo l'utente può avere filtrato o paginato)
        _chart = _nextChart(_chart);

        dataSiNDA = [
          ChartData('NDA Sì', conteggiNDA["Sì"]!.toDouble()),
        ];
        dataNoNDA = [
          ChartData('NDA No', conteggiNDA["No"]!.toDouble()),
        ];

        dataSoloRelazione = [
          ChartData('Solo committ.', conteggiRelazione["Solo"]!.toDouble()),
        ];
        dataAltriRelazione = [
          ChartData('Altri profess.', conteggiRelazione["Altri"]!.toDouble()),
        ];

        switch (_chart) {
          case ChartType.nda:
            _myAnimatedWidget = Animate(
              effects: const [FadeEffect()],
              child: _buildNDAChart(context, dataSiNDA, widget.mode, dataNoNDA),
            );

            break;
          case ChartType.relazione:
            _myAnimatedWidget = Animate(
              effects: const [
                FadeEffect(duration: Duration(milliseconds: 1000))
              ],
              child: _buildRelazioneChart(
                  context, widget.mode, dataSoloRelazione, dataAltriRelazione),
            );

            break;
          default:
            _myAnimatedWidget = _buildRelazioneChart(
                context, widget.mode, dataSoloRelazione, dataAltriRelazione);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); //se no prova a fare build mentre ricerco
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreelancersCubit, FreelancersState>(
      builder: (context, state) {
        if (state.status != FreelancersStateStatus.loaded) {
          return const SizedBox.shrink();
        } else {
          return BlocBuilder<DarkModeCubit, DarkModeState>(
            builder: (context, themeState) {
              return AnimatedSwitcher(
                duration: _myDuration,
                child: _myAnimatedWidget,
              );
            },
          );
        }
      },
    );
  }

  SfCartesianChart _buildNDAChart(BuildContext context,
      List<ChartData> dataNDAsi, ThemeMode mode, List<ChartData> dataNoNDA) {
    return SfCartesianChart(
        margin: const EdgeInsets.all(0),
        enableSideBySideSeriesPlacement: false,
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          labelAlignment: LabelAlignment.center,
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Theme.of(context).colorScheme.onPrimary),
          axisLine: const AxisLine(width: 0),
          tickPosition: TickPosition.inside,
          majorTickLines: const MajorTickLines(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(isVisible: false),
        series: <ChartSeries<ChartData, String>>[
          BarSeries<ChartData, String>(
            // width: 1,
            dataSource: dataNDAsi,
            color: ColorManager.getBackgroundColorFromNDA(NDA.no,
                mode: mode, context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
          BarSeries<ChartData, String>(
            // width: 1,
            dataSource: dataNoNDA,
            color: ColorManager.getBackgroundColorFromNDA(NDA.si,
                mode: mode, context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          )
        ]);
  }

  SfCartesianChart _buildRelazioneChart(
    BuildContext context,
    ThemeMode mode,
    List<ChartData> dataSolo,
    List<ChartData> dataAltri,
  ) {
    return SfCartesianChart(
        margin: const EdgeInsets.only(left: 10),
        enableSideBySideSeriesPlacement: false,
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          labelAlignment: LabelAlignment.center,
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Theme.of(context).colorScheme.onPrimary),
          axisLine: const AxisLine(width: 0),
          tickPosition: TickPosition.inside,
          majorTickLines: const MajorTickLines(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(isVisible: false),
        series: <ChartSeries<ChartData, String>>[
          BarSeries<ChartData, String>(
            // width: 1,
            dataSource: dataSolo,
            color: ColorManager.getBackgroundColorFromRelazione(Relazione.solo,
                mode: mode, context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
          BarSeries<ChartData, String>(
            // width: 1,
            dataSource: dataAltri,
            color: ColorManager.getBackgroundColorFromRelazione(Relazione.altri,
                mode: mode, context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
        ]);
  }
}
