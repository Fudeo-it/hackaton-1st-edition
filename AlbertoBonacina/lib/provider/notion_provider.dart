import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/notion_page.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/repository/notion_repository.dart';

part 'notion_provider.g.dart';

@riverpod
Future<List<NotionPage>?> annunciLavoroList(AnnunciLavoroListRef ref) async {
  return NotionRepository().getAnnunciLavoroList();
}

@riverpod
Future<List<NotionPage>?> progettiFreelanceList(
    ProgettiFreelanceListRef ref) async {
  return NotionRepository().getProgettiFreelanceList();
}
