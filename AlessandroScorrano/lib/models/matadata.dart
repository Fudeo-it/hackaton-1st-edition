import 'package:equatable/equatable.dart';

class AdsMetaData extends Equatable {
  final String id;
  final String dataBaseId;
  final DateTime createdTime;
  final DateTime lastEditedTime;

  const AdsMetaData({
    required this.id,
    required this.dataBaseId,
    required this.createdTime,
    required this.lastEditedTime,
  });

  factory AdsMetaData.fromJson(Map<String, dynamic> data) => AdsMetaData(
      id: data['id'],
      dataBaseId: data['parent']['database_id'],
      createdTime: DateTime.parse(data['created_time']),
      lastEditedTime: DateTime.parse(data['last_edited_time']));

  @override
  List<Object?> get props => [
        id,
        createdTime,
        lastEditedTime,
      ];
}
