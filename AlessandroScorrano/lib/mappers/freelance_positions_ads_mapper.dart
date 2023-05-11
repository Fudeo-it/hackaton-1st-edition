import 'package:annunci_lavoro_flutter/misc/mapper.dart';
import 'package:annunci_lavoro_flutter/models/ads_description.dart';
import 'package:annunci_lavoro_flutter/models/freelance_positions_model.dart';
import 'package:annunci_lavoro_flutter/services/network/dto/freelance_positions_dto.dart';

class FreeLancePositionsAdsMapper
    extends DTOMapper<FreelancePositionsAdsDTO, FreeLancePosition> {
  ///
  /// classe concreta del mapper [DTOMapper] che ritorna un oggetto di tipo [FreeLancePosition]
  ///
  FreeLancePositionsAdsMapper({required super.favouritesBloc});

  @override
  FreeLancePosition toModel(FreelancePositionsAdsDTO dto) => FreeLancePosition(
        metaData: dto.metadata,
        adsTitle: dto.adsTitle,
        applyLink: dto.applyLink,
        postedDate: dto.postedDate,
        adsUrl: dto.adsUrl,
        adsDescription: RichTextDescription(data: dto.adsDescription),
        jobRequest: RichTextDescription(data: dto.jobRequest),
        budget: RichTextDescription(data: dto.budget),
        nda: _mapNDA(dto.nda),
        workTiming: RichTextDescription(data: dto.workTiming),
        paymentTimes: RichTextDescription(data: dto.paymentTimes),
        realtionship: _mapRelationship(dto.relationship),
        isFavourite: favouritesBloc.isFavourite(dto.metadata.id),
      );

  @override
  FreelancePositionsAdsDTO toTransferObject(FreeLancePosition model) {
    throw UnimplementedError();
  }

  NDA _mapNDA(String data) {
    if (data == 'Si') {
      return NDA.yes;
    } else {
      return NDA.no;
    }
  }

  Relationship _mapRelationship(String data) {
    if (data == 'Solo con chi commissiona il lavoro') {
      return Relationship.onlyCommissioner;
    } else {
      return Relationship.otherProfessionals;
    }
  }
}
