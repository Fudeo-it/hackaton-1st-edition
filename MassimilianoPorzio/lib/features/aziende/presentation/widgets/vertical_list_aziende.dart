import 'package:auto_size_text/auto_size_text.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:job_app/features/aziende/domain/usecases/annunci_azienda_params.dart';
import 'package:loggy/loggy.dart';

import '../../../../app/presentation/cubit/dark_mode/dark_mode_cubit.dart';

import '../../../../app/resources/color_manager.dart';
import '../../../../core/domain/entities/typedefs.dart';

import '../../../../core/services/service_locator.dart';

import '../../data/repositories/aziende_repository_impl.dart';
import '../../domain/entities/annuncio_azienda.dart';
import '../../domain/repositories/aziende_repository.dart';
import '../cubit/annunci/aziende_cubit.dart';
import 'annuncio_actions.dart';
import '../../../../app/presentation/widgets/bottom_loader.dart';
import 'chips.dart';
import 'job_posted.dart';
import 'localita.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({
    Key? key,
    required this.mHeigth,
    required this.listaAnnunci,
    required this.params,
  }) : super(key: key);

  final double mHeigth;
  final AnnuncioAziendaList listaAnnunci;
  final AnnunciAzParams params;

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> with UiLoggy {
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
          .read<AziendeCubit>()
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
    bool hasMore = (sl<AziendeRepository>() as AziendeRepositoryImpl).hasMore;
    return BlocBuilder<AziendeCubit, AziendeState>(
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
                  height: 0.30 * widget.mHeigth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: index >= widget.listaAnnunci.length
                        ? const BottomLoader()
                        : CardAzienda(
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

class CardAzienda extends StatelessWidget with UiLoggy {
  final AnnuncioAzienda annuncio;
  final bool isFromPreferiti;
  const CardAzienda(
      {super.key, required this.annuncio, this.isFromPreferiti = false});

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
                  ColorManager.veryLightRed
                      .harmonizeWith(
                          Theme.of(context).colorScheme.secondaryContainer)
                      .withOpacity(0.2),
                  Theme.of(context).colorScheme.secondaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
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
                  Text(annuncio.nomeAzienda.content,
                      style: const TextStyle(fontSize: 14)),
                  if (annuncio.retribuzione != null)
                    AutoSizeText(
                      annuncio.retribuzione!,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 14),
                    ),
                  AnnuncioActions(
                    loggy: loggy,
                    annuncio: annuncio,
                    isFromPreferiti: isFromPreferiti,
                  ),

                  BlocBuilder<DarkModeCubit, DarkModeState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (annuncio.seniority != null)
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SeniorityChip(
                                seniorityEntity: annuncio.seniority!,
                                mode: state.mode,
                              ),
                            ),
                          ContrattoChip(
                            contrattoEntity: annuncio.contratto!,
                            mode: state.mode,
                          ),
                          TeamChip(
                            teamEntity: annuncio.team!,
                            mode: state.mode,
                          )
                        ],
                      );
                    },
                  ), //fine riga dei tag
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text("job posted"), Text(annuncio.localita ?? "...")
                      JobPosted(annuncio: annuncio),
                      // Text("prova")
                      Localita(annuncio: annuncio)
                    ],
                  ), //riga data e località
                ],
              ),
            )),
      ),
    );
  }
}
