import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:offertelavoroflutter_it_app/errors/network_error.dart';
import 'package:offertelavoroflutter_it_app/errors/repository_error.dart';
import 'package:offertelavoroflutter_it_app/models/bookmark_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/job_offers_mapper.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/job_projects_mapper.dart';
import 'package:offertelavoroflutter_it_app/services/network/jobs_services.dart';

class JobRepository {
  static const _kBaseKeyBookmark = "bookmark";

  final JobsService service;
  final JobOffersMapper jobOffersMapper;
  final JobProjectsMapper jobProjectsMapper;
  final FlutterSecureStorage secureStorage;

  JobRepository({
    required this.service,
    required this.jobOffersMapper,
    required this.jobProjectsMapper,
    required this.secureStorage,
  });

  Future<List<JobOfferModel>> jobsOffers(String databaseId) async {
    try {
      final response = await service.fetchJobs(databaseId);

      return response.map(jobOffersMapper.fromDTO).toList(growable: false);
    } on NetworkError catch (e, stack) {
      throw RepositoryError(e.reasonPhrase, stack.toString());
    } catch (e) {
      throw RepositoryError(e.toString());
    }
  }

  Future<List<JobProjectModel>> jobsProjects(String databaseId) async {
    try {
      final response = await service.fetchJobs(databaseId);

      return response.map(jobProjectsMapper.fromDTO).toList(growable: false);
    } on NetworkError catch (e, stack) {
      throw RepositoryError(e.reasonPhrase, stack.toString());
    } catch (e) {
      throw RepositoryError(e.toString());
    }
  }

  Future<List<BookmarkModel>> _getBookmarks() async =>
      await retrieveBookmark() ?? [];

  Future<void> createBookmark(BookmarkModel job) async {
    List<BookmarkModel> bookmarks = await _getBookmarks();
    bookmarks.add(job);

    final encodeJson =
        bookmarks.map((bookmark) => bookmark.toJson).toList(growable: false);
    final json = jsonEncode(encodeJson);

    await secureStorage.write(key: _kBaseKeyBookmark, value: json);
  }

  Stream<bool> checkBookmarkStream(BookmarkModel job) async* {
    List<BookmarkModel> bookmarks = await _getBookmarks();
    yield bookmarks.contains(job);
  }

  Future<bool> checkBookmark(BookmarkModel job) async {
    List<BookmarkModel> bookmarks = await _getBookmarks();

    return bookmarks.contains(job);
  }

  Future<List<BookmarkModel>?> retrieveBookmark() async {
    final savedBookmarks = await secureStorage.read(key: _kBaseKeyBookmark);

    if (savedBookmarks != null) {
      final jsonBookmarks = jsonDecode(savedBookmarks);

      final bookmarks = (jsonBookmarks as List)
          .map((bookmark) => BookmarkModel.fromJson(bookmark))
          .toList();

      return bookmarks;
    }

    return null;
  }

  Future<void> deleteBookmarK(BookmarkModel job) async {
    List<BookmarkModel> bookmarks = await _getBookmarks();
    bookmarks.remove(job);
    final encodeJson =
        bookmarks.map((bookmark) => bookmark.toJson).toList(growable: false);
    final json = jsonEncode(encodeJson);

    await secureStorage.write(key: _kBaseKeyBookmark, value: json);
  }
}
