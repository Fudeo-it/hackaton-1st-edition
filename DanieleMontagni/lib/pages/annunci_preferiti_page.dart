import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:offerte_lavoro_flutter_app/blocs/bloc/annuncio_bloc.dart';
import 'package:offerte_lavoro_flutter_app/blocs/freelanceBloc/bloc/annuncio_freelance_bloc.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_model.dart';
import 'package:offerte_lavoro_flutter_app/util/size_config/size_config.dart';
import 'package:offerte_lavoro_flutter_app/widgets/app_bar_custom.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_app_bar.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_freelance_slinding_panel_overview.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_sliding_panel_overview.dart';

@RoutePage()
class AnnunciPreferitiPage extends StatefulWidget {
  const AnnunciPreferitiPage({super.key});

  @override
  State<AnnunciPreferitiPage> createState() => _AnnunciPreferitiPageState();
}

class _AnnunciPreferitiPageState extends State<AnnunciPreferitiPage> {
  final PageController pageViewController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  void onPageChanged(int currentPageIndex) {
    setState(() {
      this.currentPageIndex = currentPageIndex;
    });
  }

  void onIndicatorPressed(int indicatorIndex) {
    pageViewController.animateToPage(
      indicatorIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<AnnuncioBloc, AnnuncioState>(
          listener: (context, state) {
            if (state is FetchedAnnuncioState) {
              WidgetsBinding.instance.addPostFrameCallback((_) => {
                    if (this.mounted) {setState(() {})}
                  });
            }
            final annunci = (state as FetchedAnnuncioState).annunci;
            final annunciInWishList =
                annunci.where((it) => it.inFavoritePage).toList();
          },
        ),
        BlocListener<AnnuncioFreelanceBloc, AnnuncioFreelanceState>(
          listener: (context, state) {
            if (state is FetchedAnnuncioFreelanceState) {
              WidgetsBinding.instance.addPostFrameCallback((_) => {
                    if (this.mounted) {setState(() {})}
                  });
              final annunciFreelance =
                  (state as FetchedAnnuncioFreelanceState).annunci;
              final annunciInWishList =
                  annunciFreelance.where((it) => it.inFavoritePage).toList();
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: const JobAppBar(
          child: AppBarCustom('Offerte lavoro salvate'),
        ),
        body: body(context),
      ),
    );
  }

  Widget body(BuildContext context) => Stack(
        children: [
          PageView(
            controller: pageViewController,
            onPageChanged: onPageChanged,
            children: [
              PreferitiDipendenti(
                pageViewIndex: 0,
              ),
              PreferitiFreelance(
                pageViewIndex: 1,
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: SafeArea(
                child: PageViewIndicators(
              pageViewIndex: currentPageIndex,
              onIndicatorPressed: onIndicatorPressed,
            )),
          )
        ],
      );
}

class PageViewIndicators extends StatelessWidget {
  final int pageViewIndex;
  final void Function(int index) onIndicatorPressed;

  const PageViewIndicators({
    required this.pageViewIndex,
    required this.onIndicatorPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          2,
          (index) => GestureDetector(
                onTap: () => onIndicatorPressed(index),
                child: Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: index == pageViewIndex
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              )),
    );
  }
}

class PreferitiDipendenti extends StatefulWidget {
  final int pageViewIndex;
  const PreferitiDipendenti({
    required this.pageViewIndex,
  });

  @override
  State<PreferitiDipendenti> createState() => _PreferitiDipendentiState();
}

class _PreferitiDipendentiState extends State<PreferitiDipendenti> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnuncioBloc, AnnuncioState>(
      builder: (context, state) {
        final annunci = (state as FetchedAnnuncioState).annunci;
        final annunciInWishList =
            annunci.where((it) => it.inFavoritePage).toList();

        if (!annunciInWishList.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) => {
                if (this.mounted) {setState(() {})}
              });
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Offerte salvate dipendenti',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  height: SizeConfig.blockSizeVertical * 60,
                  child: ListView.separated(
                    itemBuilder: (content, index) => InkWell(
                      onTap: () => showGeneralDialog(
                          context: context,
                          pageBuilder: (_, __, ___) {
                            return Scaffold(
                              appBar: const JobAppBar(
                                child: AppBarCustom("Preferiti dipendenti"),
                              ),
                              body: Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0.0, 20.0, 0.0, 0.0),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(24.0),
                                      topRight: Radius.circular(24.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          spreadRadius: 1,
                                          blurRadius: 5)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5, right: 5),
                                      child: IconButton(
                                        icon: Icon(Icons.close_rounded),
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    JobSlidingPanelOverview(
                                        annuncioModel:
                                            annunciInWishList[index]),
                                  ],
                                ),
                              ),
                            );
                          }),
                      child: ListTile(
                        title: Text(
                          annunciInWishList[index].titolo,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: AutoSizeText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "Data pubblicazione: " +
                              DateFormat("dd MMMM HH:MM")
                                  .format(annunciInWishList[index].jobPosted),
                        ),
                        leading: Container(
                          width: 45,
                          height: 45,
                          child: Center(
                              child: Text(
                            annunciInWishList[index].emoji,
                            style: TextStyle(fontSize: 30),
                          )),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            BlocProvider.of<AnnuncioBloc>(context).add(
                                AnnuncioFavoriteEventToggle(
                                    annunciInWishList[index]));
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.remove_circle_outline,
                          ),
                        ),
                      ),
                    ),
                    itemCount: annunciInWishList.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 8,
                      indent: 20,
                      endIndent: 20,
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) => {
                if (this.mounted) {setState(() {})}
              });
          return Center(
            child: Text(
              "Nessun annuncio dipendenti tra i preferiti",
              style: TextStyle(fontSize: 18),
            ),
          );
        }
      },
    );
  }
}

class PreferitiFreelance extends StatefulWidget {
  final int pageViewIndex;
  const PreferitiFreelance({
    required this.pageViewIndex,
  });

  @override
  State<PreferitiFreelance> createState() => _PreferitiFreelanceState();
}

class _PreferitiFreelanceState extends State<PreferitiFreelance> {
  List<AnnuncioFreelanceModel> annunciInWishList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnuncioFreelanceBloc, AnnuncioFreelanceState>(
      builder: (context, state) {
        if (state is FetchedAnnuncioFreelanceState) {
          final annunciFreelance =
              (state as FetchedAnnuncioFreelanceState).annunci;
          annunciInWishList =
              annunciFreelance.where((it) => it.inFavoritePage).toList();
          if (!annunciInWishList.isEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) => {
                  if (this.mounted) {setState(() {})}
                });
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Offerte salvate freelance',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: SizeConfig.blockSizeVertical * 60,
                    child: ListView.separated(
                      itemBuilder: (content, index) => InkWell(
                        onTap: () => showGeneralDialog(
                            context: context,
                            pageBuilder: (_, __, ___) {
                              return Scaffold(
                                appBar: const JobAppBar(
                                  child: AppBarCustom("Preferiti freelance"),
                                ),
                                body: Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      0.0, 40.0, 0.0, 0.0),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(24.0),
                                        topRight: Radius.circular(24.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                            spreadRadius: 1,
                                            blurRadius: 5)
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, right: 5),
                                        child: IconButton(
                                          icon: Icon(Icons.close_rounded),
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 5, 0),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      JobFreelanceSlidingPanelOverview(
                                        annuncioFreelanceModel:
                                            annunciInWishList[index],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        child: ListTile(
                          title: Text(
                            annunciInWishList[index].codice,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: AutoSizeText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            "Data pubblicazione: " +
                                DateFormat("dd MMMM HH:MM")
                                    .format(annunciInWishList[index].jobPosted),
                          ),
                          leading: Container(
                            width: 45,
                            height: 45,
                            child: Center(
                                child: Text(
                              annunciInWishList[index].emoji,
                              style: TextStyle(fontSize: 30),
                            )),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              BlocProvider.of<AnnuncioFreelanceBloc>(context)
                                  .add(AnnuncioFreelanceFavoriteEventToggle(
                                      annunciInWishList[index]));
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.remove_circle_outline,
                            ),
                          ),
                        ),
                      ),
                      itemCount: annunciInWishList.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: 8,
                        indent: 20,
                        endIndent: 20,
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) => {
                  if (this.mounted) {setState(() {})}
                });
            return Center(
              child: Text(
                "Nessun annuncio freelance tra i preferiti",
                style: TextStyle(fontSize: 18),
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
