/// Chart import
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/app/resources/color_manager.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/features/aziende/domain/enums/contratto.dart';
import 'package:job_app/features/aziende/domain/enums/seniority.dart';
import 'package:job_app/features/aziende/domain/enums/team.dart';
import 'package:job_app/features/aziende/presentation/cubit/annunci/aziende_cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app/presentation/cubit/dark_mode/dark_mode_cubit.dart';

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

enum ChartType {
  seniority,
  contratto,
  team;
}

class StatBarCharts extends StatefulWidget {
  const StatBarCharts({
    Key? key,
    required this.listaAnnunci,
    required this.mode,
  }) : super(key: key);

  final AnnuncioAziendaList listaAnnunci;
  final ThemeMode mode;

  @override
  State<StatBarCharts> createState() => _StatBarChartsState();
}

class _StatBarChartsState extends State<StatBarCharts> {
  late Timer _timer;
  late ChartType _chart;
  Widget _myAnimatedWidget = const SizedBox.shrink();
  late List<ChartData> dataFullTime;
  late List<ChartData> dataPartTime;
  late List<ChartData> dataJunior;
  late List<ChartData> dataMid;
  late List<ChartData> dataSenior;
  late List<ChartData> dataInSede;
  late List<ChartData> dataIbrido;
  late List<ChartData> dataFullRemote;
  final Duration _myDuration = const Duration(seconds: 3);
  Map<String, int> conteggiContratto = {"part time": 0, "full time": 0};
  Map<String, int> conteggiSeniority = {"junior": 0, "mid": 0, "senior": 0};
  Map<String, int> conteggiTeam = {"inSede": 0, "ibrido": 0, "fullRemote": 0};

  ChartType _nextChart(ChartType currentChart) {
    switch (currentChart) {
      case ChartType.seniority:
        return ChartType.contratto;
      case ChartType.contratto:
        return ChartType.team;
      case ChartType.team:
        return ChartType.seniority;
      default:
        return ChartType.seniority;
    }
  }

  @override
  void initState() {
    super.initState();
    //GIRA PRIMA DI BUILD PER AVERE GIà I DATI
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      for (var annuncio in widget.listaAnnunci) {
        if (annuncio.contratto != null) {
          if (annuncio.contratto!.contratto == Contratto.partTime) {
            conteggiContratto["part time"] =
                conteggiContratto["part time"]! + 1;
          }
          if (annuncio.contratto!.contratto == Contratto.fullTime) {
            conteggiContratto["full time"] =
                conteggiContratto["full time"]! + 1;
          }
        } //fine conteggi su tipo contratto
        if (annuncio.seniority != null) {
          switch (annuncio.seniority!.seniority) {
            case Seniority.junior:
              conteggiSeniority["junior"] = conteggiSeniority["junior"]! + 1;
              break;
            case Seniority.mid:
              conteggiSeniority["mid"] = conteggiSeniority["mid"]! + 1;
              break;
            case Seniority.senior:
              conteggiSeniority["senior"] = conteggiSeniority["senior"]! + 1;
              break;
            default:
          }
        } //fine conteggio tipo seniority
        if (annuncio.team != null) {
          switch (annuncio.team!.team) {
            case Team.inSede:
              conteggiTeam["inSede"] = conteggiTeam["inSede"]! + 1;
              break;
            case Team.ibrido:
              conteggiTeam["ibrido"] = conteggiTeam["ibrido"]! + 1;
              break;
            case Team.fullRemote:
              conteggiTeam["fullRemote"] = conteggiTeam["fullRemote"]! + 1;
              break;
            default:
          }
        } //fine conteggio tipo Team
      }
      dataFullTime = [
        ChartData('Full Time', conteggiContratto["full time"]!.toDouble()),
      ];
      dataPartTime = [
        ChartData('Part Time', conteggiContratto["part time"]!.toDouble()),
      ];

      dataJunior = [
        ChartData('Junior', conteggiSeniority["junior"]!.toDouble()),
      ];
      dataMid = [
        ChartData('Mid', conteggiSeniority["mid"]!.toDouble()),
      ];

      dataSenior = [
        ChartData('Senior', conteggiSeniority["senior"]!.toDouble()),
      ];

      dataInSede = [
        ChartData('In sede', conteggiTeam["inSede"]!.toDouble()),
      ];
      dataIbrido = [
        ChartData('Ibrido', conteggiTeam["ibrido"]!.toDouble()),
      ];
      dataFullRemote = [
        ChartData('Full remote', conteggiTeam["fullRemote"]!.toDouble()),
      ];

      _chart = ChartType.seniority;
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
      setState(() {
        _chart = _nextChart(_chart);
        for (var annuncio in widget.listaAnnunci) {
          if (annuncio.contratto != null) {
            if (annuncio.contratto!.contratto == Contratto.partTime) {
              conteggiContratto["part time"] =
                  conteggiContratto["part time"]! + 1;
            }
            if (annuncio.contratto!.contratto == Contratto.fullTime) {
              conteggiContratto["full time"] =
                  conteggiContratto["full time"]! + 1;
            }
          } //fine conteggi su tipo contratto
          if (annuncio.seniority != null) {
            switch (annuncio.seniority!.seniority) {
              case Seniority.junior:
                conteggiSeniority["junior"] = conteggiSeniority["junior"]! + 1;
                break;
              case Seniority.mid:
                conteggiSeniority["mid"] = conteggiSeniority["mid"]! + 1;
                break;
              case Seniority.senior:
                conteggiSeniority["senior"] = conteggiSeniority["senior"]! + 1;
                break;
              default:
            }
          } //fine conteggio tipo seniority
          if (annuncio.team != null) {
            switch (annuncio.team!.team) {
              case Team.inSede:
                conteggiTeam["inSede"] = conteggiTeam["inSede"]! + 1;
                break;
              case Team.ibrido:
                conteggiTeam["ibrido"] = conteggiTeam["ibrido"]! + 1;
                break;
              case Team.fullRemote:
                conteggiTeam["fullRemote"] = conteggiTeam["fullRemote"]! + 1;
                break;
              default:
            }
          } //fine conteggio tipo Team
        }
        dataFullTime = [
          ChartData('Full Time', conteggiContratto["full time"]!.toDouble()),
        ];
        dataPartTime = [
          ChartData('Part Time', conteggiContratto["part time"]!.toDouble()),
        ];

        dataJunior = [
          ChartData('Junior', conteggiSeniority["junior"]!.toDouble()),
        ];
        dataMid = [
          ChartData('Mid', conteggiSeniority["mid"]!.toDouble()),
        ];

        dataSenior = [
          ChartData('Senior', conteggiSeniority["senior"]!.toDouble()),
        ];

        dataInSede = [
          ChartData('In sede', conteggiTeam["inSede"]!.toDouble()),
        ];
        dataIbrido = [
          ChartData('Ibrido', conteggiTeam["ibrido"]!.toDouble()),
        ];
        dataFullRemote = [
          ChartData('Full remote', conteggiTeam["fullRemote"]!.toDouble()),
        ];
        switch (_chart) {
          case ChartType.contratto:
            _myAnimatedWidget = Animate(
              effects: const [FadeEffect()],
              child: _buildContrattoChart(
                context,
                dataFullTime,
                widget.mode,
                dataPartTime,
              ),
            );

            break;
          case ChartType.team:
            _myAnimatedWidget = Animate(
              effects: const [FadeEffect()],
              child: _buildTeamChart(
                context,
                widget.mode,
                dataInSede,
                dataIbrido,
                dataFullRemote,
              ),
            );

            break;
          case ChartType.seniority:
            _myAnimatedWidget = Animate(
              effects: const [
                FadeEffect(duration: Duration(milliseconds: 1000))
              ],
              child: _buildSeniorityChart(
                  context, widget.mode, dataJunior, dataMid, dataSenior),
            );

            break;
          default:
            _myAnimatedWidget = _buildSeniorityChart(
                context, widget.mode, dataJunior, dataMid, dataSenior);
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
    return BlocBuilder<AziendeCubit, AziendeState>(
      builder: (context, state) {
        if (state.status != AziendeStateStatus.loaded) {
          return const SizedBox.shrink();
        } else {
          return BlocBuilder<DarkModeCubit, DarkModeState>(
            builder: (context, themeState) {
              // return buildContrattoChart(
              //     context, dataFullTime, themeState, dataPartTime);
              // return buildSeniorityChart(
              //     context, themeState, dataJunior, dataMid, dataSenior);
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

  SfCartesianChart _buildContrattoChart(
      BuildContext context,
      List<ChartData> dataFullTime,
      ThemeMode mode,
      List<ChartData> dataPartTime) {
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
            dataSource: dataFullTime,
            color: ColorManager.getBackgroundColorFromContratto(
                Contratto.fullTime,
                mode: mode,
                context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
          BarSeries<ChartData, String>(
            // width: 1,
            dataSource: dataPartTime,
            color: ColorManager.getBackgroundColorFromContratto(
                Contratto.partTime,
                mode: mode,
                context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          )
        ]);
  }

  SfCartesianChart _buildSeniorityChart(
      BuildContext context,
      ThemeMode mode,
      List<ChartData> dataJunior,
      List<ChartData> dataMid,
      List<ChartData> dataSenior) {
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
            dataSource: dataJunior,
            color: ColorManager.getBackgroundColorFromSeniority(
                Seniority.junior,
                mode: mode,
                context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
          BarSeries<ChartData, String>(
            // width: 1,
            dataSource: dataMid,
            color: ColorManager.getBackgroundColorFromSeniority(Seniority.mid,
                mode: mode, context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
          BarSeries<ChartData, String>(
            // width: 1,
            dataSource: dataSenior,
            color: ColorManager.getBackgroundColorFromSeniority(
                Seniority.senior,
                mode: mode,
                context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          )
        ]);
  }

  SfCartesianChart _buildTeamChart(
      BuildContext context,
      ThemeMode mode,
      List<ChartData> dataInSede,
      List<ChartData> dataIbrido,
      List<ChartData> dataFullRemote) {
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
            dataSource: dataInSede,
            color: ColorManager.getBackgroundColorFromTeam(Team.inSede,
                mode: mode, context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
          BarSeries<ChartData, String>(
            // width: 1,
            dataSource: dataIbrido,
            color: ColorManager.getBackgroundColorFromTeam(Team.ibrido,
                mode: mode, context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
          BarSeries<ChartData, String>(
            // width: 1,
            dataSource: dataFullRemote,
            color: ColorManager.getBackgroundColorFromTeam(Team.fullRemote,
                mode: mode, context: context),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          )
        ]);
  }
}
