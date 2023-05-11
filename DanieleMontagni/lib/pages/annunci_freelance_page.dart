import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offerte_lavoro_flutter_app/blocs/freelanceBloc/bloc/annuncio_freelance_bloc.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';
import 'package:offerte_lavoro_flutter_app/repositories/annuncio_freelance_repository.dart';
import 'package:offerte_lavoro_flutter_app/util/size_config/size_config.dart';
import 'package:offerte_lavoro_flutter_app/widgets/app_bar_custom.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_app_bar.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_freelance_slinding_panel_overview.dart';
import 'package:offerte_lavoro_flutter_app/widgets/job_widget_freelance.dart';
import 'package:offerte_lavoro_flutter_app/widgets/shimmed_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
class AnnunciFreelancePage extends StatefulWidget {
  @override
  State<AnnunciFreelancePage> createState() => _AnnunciFreelancePageState();
}

class _AnnunciFreelancePageState extends State<AnnunciFreelancePage> {
  // @override
  // void initState() {
    // super.initState();
    // BlocProvider.of<AnnuncioFreelanceBloc>(context)
        // .add(FetchAnnuncioFreelanceEvent());
  // }

  final slidingUpPanelController = PanelController();

  AnnuncioFreelanceModel? currentAnnuncio;

  void onJobWidgetFreelancePressed(
      AnnuncioFreelanceModel annuncioFreelanceModel) {
    setState(() {
      currentAnnuncio = annuncioFreelanceModel;
    });
    if (slidingUpPanelController.isAttached) {
      slidingUpPanelController.open();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const JobAppBar(
        child: AppBarCustom('Offerte lavoro per Freelance'),
      ),
      body: SlidingUpPanel(
        color: Theme.of(context).colorScheme.onSecondary,
        controller: slidingUpPanelController,
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        backdropEnabled: true,
        backdropOpacity: 0.75,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        onPanelClosed: () => setState(() {}),
        panel: currentAnnuncio == null
            ? SizedBox()
            : BlocBuilder<AnnuncioFreelanceBloc, AnnuncioFreelanceState>(
                builder: (context, state) {
                  if (state is FetchingAnnuncioFreelanceState) {
                    return SizedBox();
                  } else {
                    WidgetsBinding.instance.addPostFrameCallback((_) => {
                          if (this.mounted) {setState(() {})}
                        });
                    final annunci =
                        (state as FetchedAnnuncioFreelanceState).annunci;
                  }
                  return JobFreelanceSlidingPanelOverview(
                      annuncioFreelanceModel: currentAnnuncio!);
                },
              ),
        body: _body(
          context,
        ),
      ));

  Widget _body(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Offerte attive',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: SizeConfig.blockSizeVertical * 75,
              child: BlocBuilder<AnnuncioFreelanceBloc, AnnuncioFreelanceState>(
                builder: (context, state) {
                  if (state is FetchedAnnuncioFreelanceState) {
                    WidgetsBinding.instance.addPostFrameCallback((_) => {
                          if (this.mounted) {setState(() {})}
                        });
                    return _annunciFreelanceWidget(
                        annunciFreelance: state.annunci);
                  } else if (state is NoAnnuncioFreelanceState) {
                    return _noAnnunciFreelanceWidget();
                  } else if (state is ErrorAnnuncioFreelanceState) {
                    return _errorAnnunciFreelanceWidget();
                  } else if (state is FetchingAnnuncioFreelanceState) {
                    return _fetchingAnnunciFreelanceWidget();
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      );

  Widget _annunciFreelanceWidget(
          {required List<AnnuncioFreelanceModel> annunciFreelance}) =>
      ListView.separated(
        itemBuilder: (content, index) =>
            BlocBuilder<AnnuncioFreelanceBloc, AnnuncioFreelanceState>(
          builder: (context, state) {
            final annunciFreelance =
                (state as FetchedAnnuncioFreelanceState).annunci;
            final annunciInWishList =
                annunciFreelance.where((it) => it.inFavoritePage).toList();
            return JobWidgetFreelance(
              annuncioFreelance: annunciFreelance[index],
              onPressed: () =>
                  onJobWidgetFreelancePressed(annunciFreelance[index]),
            );
          },
        ),
        itemCount: annunciFreelance.length,
        separatorBuilder: (context, index) => const Divider(
          height: 8,
          indent: 20,
          endIndent: 20,
          thickness: 1,
        ),
      );

  Widget _noAnnunciFreelanceWidget() =>
      const Center(child: Text('Nessuna annuncio disponibile'));

  Widget _errorAnnunciFreelanceWidget() => const Center(
      child: Text('Errore nell\'ottenere l\'elenco degli annunci'));

  Widget _fetchingAnnunciFreelanceWidget() =>
      ShimmedWidget(child: JobWidgetFreelance.shimmed());
}
