import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/annuncio.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_page.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/home/screen/annunci/ui/annuncio_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/provider/AsyncValueWidget.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/provider/notion_provider.dart';

class AnnunciScreen extends ConsumerWidget {
  const AnnunciScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final annunciLavoroList = ref.watch(annunciLavoroListProvider);

    return AsyncValueWidget<List<NotionPage>?>(
      value: annunciLavoroList,
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data!.length,
          itemBuilder: (BuildContext _, int index) {
            return AnnuncioRow(annuncio: Annuncio.fromNotionPage(data[index]));
          },
        );
      },
    );
  }
}
