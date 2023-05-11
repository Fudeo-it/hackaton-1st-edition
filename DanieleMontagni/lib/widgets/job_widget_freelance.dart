import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:offerte_lavoro_flutter_app/blocs/freelanceBloc/bloc/annuncio_freelance_bloc.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';

class JobWidgetFreelance extends StatefulWidget {
  final AnnuncioFreelanceModel? annuncioFreelance;
  final void Function()? onPressed;

  const JobWidgetFreelance({
    this.annuncioFreelance,
    this.onPressed,
  });

  factory JobWidgetFreelance.shimmed({Key? key}) =>
      JobWidgetFreelance(annuncioFreelance: null);

  @override
  State<JobWidgetFreelance> createState() => _JobWidgetFreelanceState();
}

class _JobWidgetFreelanceState extends State<JobWidgetFreelance> {
  @override
  Widget build(BuildContext context) =>
      BlocListener<AnnuncioFreelanceBloc, AnnuncioFreelanceState>(
        listener: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) => {
                if (this.mounted) {setState(() {})}
              });
          if (state is FetchedAnnuncioFreelanceState) {
            final annunciFreelance =
                (state as FetchedAnnuncioFreelanceState).annunci;
            final annunciInWishList =
                annunciFreelance.where((it) => it.inFavoritePage).toList();
          }
        },
        child: InkWell(
          onTap: widget.onPressed,
          child: ListTile(
            title: widget.annuncioFreelance != null
                ? Text(
                    widget.annuncioFreelance!.codice,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(
                    height: 10,
                    color: Colors.grey,
                  ),
            subtitle: widget.annuncioFreelance != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("dd MMMM HH:MM")
                            .format(widget.annuncioFreelance!.jobPosted),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AnnuncioFreelanceBloc>(context).add(
                              AnnuncioFreelanceFavoriteEventToggle(
                                  widget.annuncioFreelance!));
                          setState(() {});
                        },
                        padding: EdgeInsets.only(left: 32, bottom: 16),
                        icon: widget.annuncioFreelance!.inFavoritePage
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
                child: widget.annuncioFreelance != null
                    ? Text(
                        widget.annuncioFreelance!.emoji,
                        style: TextStyle(fontSize: 30),
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey,
                      ),
              ),
            ),
          ),
        ),
      );
}
