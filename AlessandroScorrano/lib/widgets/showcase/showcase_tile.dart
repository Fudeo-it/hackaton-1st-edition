import 'package:annunci_lavoro_flutter/widgets/showcase/show_case_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowcaseTile extends StatefulWidget {
  ///
  /// Widget utilizzato per mostrare una card dell'annuncio Mock nel tutorial dell'app.
  ///
  final GlobalKey buttonglobalKey;
  final GlobalKey cardGlobalkey;
  ShowcaseTile({
    required this.buttonglobalKey,
    required this.cardGlobalkey,
    super.key,
  });

  @override
  State<ShowcaseTile> createState() => _ShowcaseTileState();
}

class _ShowcaseTileState extends State<ShowcaseTile> {
  @override
  Widget build(BuildContext context) {
    return ShowCaseView(
      globalKey: widget.cardGlobalkey,
      title: 'Anteprima annuncio',
      description:
          "Fai tap sull'annuncio per visualizzarlo\n\noppure fai un tap prolungato per le azioni rapide",
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                spreadRadius: 0,
                blurRadius: 0.9,
                offset: Offset(0, 2),
              ),
            ]),
        margin: const EdgeInsets.all(6),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          tileColor: Theme.of(context).cardColor,
          contentPadding: const EdgeInsets.all(10),
          isThreeLine: true,
          iconColor: Theme.of(context).iconTheme.color,
          minVerticalPadding: 0,
          horizontalTitleGap: 0,
          leading: Icon(FontAwesomeIcons.globe),
          title: Text(
            'Titolo annuncio',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Nome azienda',
                  style: Theme.of(context).textTheme.titleMedium!),
              const SizedBox(height: 4),
              Text(
                'Retribuzione',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          trailing: ShowCaseView(
              globalKey: widget.buttonglobalKey,
              title: 'Salva',
              description: 'Salva o rimuovi gli annunci dai preferiti',
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.bookmark,
                  color: Theme.of(context).primaryColor,
                ),
              )),
        ),
      ),
    );
  }
}
