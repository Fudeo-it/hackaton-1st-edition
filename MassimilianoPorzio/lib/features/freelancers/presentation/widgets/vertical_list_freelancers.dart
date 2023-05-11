import 'package:auto_size_text/auto_size_text.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:job_app/app/presentation/widgets/bottom_loader.dart';
import 'package:job_app/features/freelancers/data/repositories/freelancers_repo_impl.dart';
import 'package:job_app/features/freelancers/domain/entities/annuncio_freelancer.dart';
import 'package:job_app/features/freelancers/domain/usecases/annunci_freelancer_params.dart';

import 'package:job_app/features/freelancers/presentation/cubit/annunci/freelancers_cubit.dart';
import 'package:loggy/loggy.dart';

import '../../../../app/presentation/cubit/dark_mode/dark_mode_cubit.dart';

import '../../../../app/resources/color_manager.dart';
import '../../../../core/domain/entities/typedefs.dart';

import '../../../../core/services/service_locator.dart';

import '../../domain/repositories/freelancers_repo.dart';
import 'annuncio_actions.dart';

import 'chips_freelancers.dart';
import 'job_posted_freelancers.dart';

class VerticalListFreelancers extends StatefulWidget {
  const VerticalListFreelancers({
    Key? key,
    required this.mHeigth,
    required this.listaAnnunci,
    required this.params,
  }) : super(key: key);

  final double mHeigth;
  final AnnuncioFreelancerList listaAnnunci;
  final AnnunciFreelancersParams params;

  @override
  State<VerticalListFreelancers> createState() =>
      _VerticalListFreelancersState();
}

class _VerticalListFreelancersState extends State<VerticalListFreelancers>
    with UiLoggy {
  final ScrollController _scrollController = ScrollController();

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context
          .read<FreelancersCubit>()
          .refreshAnnunci(widget.params); //carico altri annunci
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hasMore =
        (sl<FreelancersRepository>() as FreelancersRepositoryImpl).hasMore;
    return BlocBuilder<FreelancersCubit, FreelancersState>(
      builder: (context, state) {
        return Expanded(
          child: Scrollbar(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),

              controller: _scrollController,
              // key: const PageStorageKey<String>(
              //     'Aziende'), //mi tiene la posizione in cui ero
              itemCount: hasMore
                  ? widget.listaAnnunci.length + 1
                  : widget.listaAnnunci.length, //+ 1 per il bottomLoader
              itemBuilder: (context, index) {
                // print("index: $index");
                // print("lista Annunci ha ${widget.listaAnnunci.length} annunci");
                return SizedBox(
                  height: 0.25 * widget.mHeigth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: index >= widget.listaAnnunci.length
                        ? const BottomLoader()
                        : CardFreelancers(
                            annuncio: widget.listaAnnunci[index],
                          ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CardFreelancers extends StatelessWidget with UiLoggy {
  final AnnuncioFreelancers annuncio;
  final bool isFromPreferiti;
  const CardFreelancers({
    super.key,
    required this.annuncio,
    this.isFromPreferiti = false,
  });

  @override
  Widget build(BuildContext context) {
    var serverParser = EmojiParser(init: true);
    var emoji = serverParser.get(annuncio.emoji);

    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(DettaglioAnnunciAziende.routeName,
        //     arguments: AnnuncioAziendeArguments(index.toString()));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        child: Container(
            decoration: BoxDecoration(
              // color: ColorManager.notionLightBoxGrey,

              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  ColorManager.notionLightPrimary
                      .harmonizeWith(
                          Theme.of(context).colorScheme.primaryContainer)
                      .withOpacity(0.2),
                  Theme.of(context).colorScheme.errorContainer.withOpacity(0.2),
                ],
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
              ),
            ),
            // child: Center(child: Text('$index'))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          emoji.code,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Expanded(
                          child: AutoSizeText(annuncio.titolo,
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
                  ),

                  AnnuncioActionsFreelancers(
                    loggy: loggy,
                    annuncio: annuncio,
                    isFromPreferiti: isFromPreferiti,
                  ),

                  BlocBuilder<DarkModeCubit, DarkModeState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (annuncio.nda != null)
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: NDAChip(
                                ndaEntity: annuncio.nda!,
                                mode: state.mode,
                              ),
                            ),
                          if (annuncio.relazione != null)
                            RelazioneChip(
                              relazioneEntity: annuncio.relazione!,
                              mode: state.mode,
                            ),
                        ],
                      );
                    },
                  ), //fine riga dei tag
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text("job posted"), Text(annuncio.localita ?? "...")
                      JobPostedFreelancers(annuncio: annuncio),
                      // Text("prova")
                    ],
                  ), //riga data
                ],
              ),
            )),
      ),
    );
  }
}
