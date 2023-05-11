import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';

import '../../../../core/domain/entities/typedefs.dart';
import '../../../aziende/presentation/widgets/vertical_list_aziende.dart';
import '../../../freelancers/domain/usecases/annunci_freelancer_params.dart';
import '../../../freelancers/presentation/cubit/annunci/freelancers_cubit.dart';
import '../../../freelancers/presentation/widgets/vertical_list_freelancers.dart';

class VerticalListPreferiti extends StatefulWidget {
  const VerticalListPreferiti({
    Key? key,
    required this.mHeigth,
    required this.listaPreferiti,
  }) : super(key: key);

  final double mHeigth;
  final ListaPreferiti listaPreferiti;

  @override
  State<VerticalListPreferiti> createState() => _VerticalListPreferitiState();
}

class _VerticalListPreferitiState extends State<VerticalListPreferiti>
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
      //TODO fare tipo paginazione
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
              itemCount: widget.listaPreferiti.length, //+ 1 per il bottomLoader
              itemBuilder: (context, index) {
                // print("index: $index");
                // print("lista Annunci ha ${widget.listaAnnunci.length} annunci");
                return SizedBox(
                  height: 0.25 * widget.mHeigth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: widget.listaPreferiti[index].isAzienda
                        ? CardAzienda(
                            annuncio:
                                widget.listaPreferiti[index].annuncioAzienda!,
                            isFromPreferiti: true,
                          )
                        : CardFreelancers(
                            annuncio: widget
                                .listaPreferiti[index].annuncioFreelancers!,
                            isFromPreferiti: true,
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
