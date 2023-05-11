import 'package:offertelavoroflutter/errors/local_error.dart';
import 'package:offertelavoroflutter/errors/network_error.dart';
import 'package:offertelavoroflutter/errors/repository_error.dart';
import 'package:offertelavoroflutter/models/freelance_project.dart';
import 'package:offertelavoroflutter/models/announcement.dart';
import 'package:offertelavoroflutter/repositories/mapper/freelance_project_mapper.dart';
import 'package:offertelavoroflutter/repositories/mapper/announcement_mapper.dart';
import 'package:offertelavoroflutter/services/local/job_offer_local_service.dart';
import 'package:offertelavoroflutter/services/network/dto/announcement_dto.dart';
import 'package:offertelavoroflutter/services/network/dto/freelance_project_dto.dart';
import 'package:offertelavoroflutter/services/network/job_offer_network_service.dart';

class JobOfferRepository {
  final AnnouncementMapper announcementMapper;
  final FreelanceProjectMapper freelanceProjectMapper;
  final JobOfferNetworkService networkService;
  final JobOfferLocalService localService;

  JobOfferRepository({
    required this.announcementMapper,
    required this.freelanceProjectMapper,
    required this.networkService,
    required this.localService,
  });

  Future<List<Announcement>> announcements() async {
    try {
      final favoriteAnnouncements =
          await localService.getFavouriteAnnouncements();
      final announcementsDTO = (await networkService.announcements());
      final announcements = announcementsDTO.map((e) {
        final model = announcementMapper.toModel(e);
        return model.copyWith(
          favorite:
              favoriteAnnouncements.indexWhere((id) => id == model.id) != -1,
        );
      }).toList();

      return announcements;
    } on NetworkError {
      rethrow;
    } on LocalError {
      rethrow;
    } catch (e) {
      throw RepositoryError();
    }
  }

  Future<List<Announcement>> favoriteAnnouncements() async {
    try {
      final favoriteAnnouncements =
          await localService.getFavouriteAnnouncements();
      if (favoriteAnnouncements.isEmpty) {
        return [];
      }
      final List<AnnouncementDTO> announcementsDTO = [];
      final List<String> deletedAnnouncements = [];
      for (String id in favoriteAnnouncements) {
        final announcementDTO = await networkService.announcementById(id);
        if (announcementDTO != null) {
          announcementsDTO.add(announcementDTO);
        } else {
          deletedAnnouncements.add(id);
        }
      }
      localService.multiDeleteFavouriteAnnouncement(ids: deletedAnnouncements);

      final announcements = announcementsDTO.map((e) {
        final model = announcementMapper.toModel(e);
        return model.copyWith(
          favorite: true,
        );
      }).toList();

      return announcements;
    } on NetworkError {
      rethrow;
    } on LocalError {
      rethrow;
    } catch (e) {
      throw RepositoryError();
    }
  }

  Future<List<FreelanceProject>> favoriteFreelanceProjects() async {
    try {
      final favoriteFreelanceProjects =
          await localService.getFavouriteFreelanceProjects();
      if (favoriteFreelanceProjects.isEmpty) {
        return [];
      }
      final List<FreelanceProjectDTO> freelanceProjectsDTO = [];
      final List<String> deletedFreelanceProjects = [];
      for (String id in favoriteFreelanceProjects) {
        final freelanceProjectDTO =
            await networkService.freelanceProjectById(id);
        if (freelanceProjectDTO != null) {
          freelanceProjectsDTO.add(freelanceProjectDTO);
        } else {
          deletedFreelanceProjects.add(id);
        }
      }
      localService.multiDeleteFavouriteFreelanceProjects(
          ids: deletedFreelanceProjects);

      final freelanceProjects = freelanceProjectsDTO.map((e) {
        final model = freelanceProjectMapper.toModel(e);
        return model.copyWith(
          favorite: true,
        );
      }).toList();

      return freelanceProjects;
    } on NetworkError {
      rethrow;
    } on LocalError {
      rethrow;
    } catch (e) {
      throw RepositoryError();
    }
  }

  Future<List<FreelanceProject>> freelanceProjects() async {
    try {
      final favoriteAnnouncements =
          await localService.getFavouriteFreelanceProjects();
      final freelanceProjectsDTO = (await networkService.freelanceProjects());
      final freelanceProjects = freelanceProjectsDTO.map((e) {
        final model = freelanceProjectMapper.toModel(e);
        return model.copyWith(
          favorite:
              favoriteAnnouncements.indexWhere((id) => id == model.id) != -1,
        );
      }).toList();

      return freelanceProjects;
    } on NetworkError {
      rethrow;
    } on LocalError {
      rethrow;
    } catch (e) {
      throw RepositoryError(e.toString());
    }
  }
}
