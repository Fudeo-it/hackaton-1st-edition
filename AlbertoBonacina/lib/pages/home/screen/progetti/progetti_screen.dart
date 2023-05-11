import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_page.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/progetto.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/home/screen/progetti/ui/progetto_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/provider/AsyncValueWidget.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/provider/notion_provider.dart';

class ProgettiScreen extends ConsumerWidget {
  const ProgettiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progettiFreelanceList = ref.watch(progettiFreelanceListProvider);

    return AsyncValueWidget<List<NotionPage>?>(
      value: progettiFreelanceList,
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data!.length,
          itemBuilder: (BuildContext _, int index) {
            return ProgettoRow(progetto: Progetto.fromNotionPage(data[index]));
          },
        );
      },
    );
  }
}
