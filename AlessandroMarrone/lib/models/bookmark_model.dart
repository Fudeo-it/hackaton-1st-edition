import 'package:equatable/equatable.dart';

class BookmarkModel extends Equatable {
  final String id;

  const BookmarkModel({
    required this.id,
  });

  @override
  List<Object?> get props => [id];

  factory BookmarkModel.fromJson(Map<String, dynamic> json) =>
      BookmarkModel(id: json["id"]);

  Map<String, dynamic> get toJson => {
        "id": id,
      };
}
