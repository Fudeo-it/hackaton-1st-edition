import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_model.dart';

import '../blocs/bloc/annuncio_bloc.dart';

class JobWidget extends StatefulWidget {
  final AnnuncioModel? annuncio;
  final void Function()? onPressed;

  const JobWidget({
    this.annuncio,
    this.onPressed,
  });

  factory JobWidget.shimmed({Key? key}) => JobWidget(annuncio: null);

  @override
  State<JobWidget> createState() => _JobWidgetState();
}

class _JobWidgetState extends State<JobWidget> {
  @override
  Widget build(BuildContext context) =>
      BlocListener<AnnuncioBloc, AnnuncioState>(
        listener: (context, state) {
          final annunci = (state as FetchedAnnuncioState).annunci;
          final annunciInWishList =
              annunci.where((it) => it.inFavoritePage).toList();
          WidgetsBinding.instance.addPostFrameCallback((_) => {
          if (this.mounted) {setState(() {})}
          });
        },
        child: InkWell(
          onTap: widget.onPressed,
          child: ListTile(
            title: widget.annuncio != null
                ? Text(
                    widget.annuncio!.titolo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(
                    height: 10,
                    color: Colors.grey,
                  ),
            subtitle: widget.annuncio != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("dd MMMM HH:MM")
                            .format(widget.annuncio!.jobPosted),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AnnuncioBloc>(context).add(
                              AnnuncioFavoriteEventToggle(widget.annuncio!));
                          setState(() {});
                        },
                        padding: EdgeInsets.only(left: 32, bottom: 16),
                        icon: widget.annuncio!.inFavoritePage
                            ? Icon(
                                Icons.favorite_rounded,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_outline),
                      ),
                    ],
                  )
                : Container(
                    height: 10,
                    color: Colors.grey,
                  ),
            leading: Container(
              width: 45,
              height: 45,
              child: Center(
                child: widget.annuncio != null
                    ? Text(
                        widget.annuncio!.emoji,
                        style: TextStyle(fontSize: 30),
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey,
                      ),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 70,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: widget.annuncio != null
                        ? (widget.annuncio!.seniority! == 'Junior'
                            ? Colors.green.shade100
                            : widget.annuncio!.seniority! == 'Mid'
                                ? Colors.yellow.shade300
                                : widget.annuncio!.seniority! == 'Senior'
                                    ? Colors.red.shade200
                                    : Colors.grey.shade300)
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: widget.annuncio != null
                        ? AutoSizeText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            widget.annuncio!.seniority!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          )
                        : Container(
                            height: 10,
                            width: 50,
                            color: Colors.grey,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  width: 70,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: widget.annuncio != null
                        ? (widget.annuncio!.contratto! == 'Full time'
                            ? Colors.blue.shade100
                            : Colors.grey.shade300)
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: widget.annuncio != null
                        ? AutoSizeText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            widget.annuncio!.contratto!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          )
                        : Container(
                            height: 10,
                            width: 50,
                            color: Colors.grey,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
