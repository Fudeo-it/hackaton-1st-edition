import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:pine/pine.dart';

class FiltersDTO extends DTO with EquatableMixin {
  final String textFilter;
  final String codeFilter;
  final List<String> teamFilter;
  final List<String> seniorityFilter;
  final List<String> contractFilter;
  final List<String> relationshipFilter;
  final List<String> ndaFilter;

  const FiltersDTO({
    this.textFilter = '',
    this.codeFilter = '',
    this.teamFilter = const [],
    this.contractFilter = const [],
    this.seniorityFilter = const [],
    this.relationshipFilter = const [],
    this.ndaFilter = const [],
  });

  bool get isNotEmpty =>
      textFilter.isNotEmpty ||
      teamFilter.isNotEmpty ||
      seniorityFilter.isNotEmpty ||
      contractFilter.isNotEmpty ||
      codeFilter.isNotEmpty ||
      relationshipFilter.isNotEmpty ||
      ndaFilter.isNotEmpty;

  Map<String, dynamic> toJson() => {
        K.andKey: [
          if (textFilter.isNotEmpty)
            {
              K.propertyKey: K.namePropertyKey,
              K.titleKey: {K.containsKey: textFilter},
            },
          if (codeFilter.isNotEmpty)
            {
              K.propertyKey: K.codiceKey,
              K.titleKey: {K.containsKey: codeFilter},
            },
          if (teamFilter.isNotEmpty)
            {
              K.orKey: teamFilter
                  .map(
                    (e) => {
                      K.propertyKey: K.teamKey,
                      K.selectKey: {
                        K.equalKey: e,
                      },
                    },
                  )
                  .toList(growable: false),
            },
          if (seniorityFilter.isNotEmpty)
            {
              K.orKey: seniorityFilter
                  .map(
                    (e) => {
                      K.propertyKey: K.seniorityKey,
                      K.selectKey: {
                        K.equalKey: e,
                      },
                    },
                  )
                  .toList(growable: false),
            },
          if (contractFilter.isNotEmpty)
            {
              K.orKey: contractFilter
                  .map(
                    (e) => {
                      K.propertyKey: K.contractKey,
                      K.selectKey: {
                        K.equalKey: e,
                      },
                    },
                  )
                  .toList(growable: false),
            },
          if (relationshipFilter.isNotEmpty)
            {
              K.orKey: relationshipFilter
                  .map(
                    (e) => {
                      K.propertyKey: K.tipoDiRelazioneKey,
                      K.selectKey: {
                        K.equalKey: e,
                      },
                    },
                  )
                  .toList(growable: false),
            },
          if (ndaFilter.isNotEmpty)
            {
              K.orKey: ndaFilter
                  .map(
                    (e) => {
                      K.propertyKey: K.ndaKey,
                      K.selectKey: {
                        K.equalKey: e,
                      },
                    },
                  )
                  .toList(growable: false),
            },
        ],
      };

  @override
  List<Object?> get props => [
        textFilter,
        codeFilter,
        teamFilter,
        seniorityFilter,
        contractFilter,
        relationshipFilter,
        ndaFilter,
      ];
}
