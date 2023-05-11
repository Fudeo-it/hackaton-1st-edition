import 'package:fudeo_api/src/models/deserializable.dart';

class NotionPageResponse<T extends Deserializable> extends Deserializable {
  NotionPageResponse.fromJson(
    super.json,
    T Function(Map<String, dynamic>) fromJson,
  )   : object = json['object'] as String,
        id = json['id'] as String,
        createdTime = json['created_time'] as String,
        lastEditedTime = json['last_edited_time'] as String,
        createdBy =
            ObjectIdUnion.fromJson(json['created_by'] as Map<String, dynamic>),
        lastEditedBy = ObjectIdUnion.fromJson(
          json['last_edited_by'] as Map<String, dynamic>,
        ),
        cover = json['cover'] != null
            ? Cover.fromJson(json['cover'] as Map<String, dynamic>)
            : null,
        icon = json['icon'] != null
            ? Icon.fromJson(json['icon'] as Map<String, dynamic>)
            : null,
        parent = Parent.fromJson(json['parent'] as Map<String, dynamic>),
        archived = json['archived'] as bool,
        url = json['url'] as String,
        properties = fromJson(json['properties'] as Map<String, dynamic>),
        super.fromJson();

  final String object;
  final String id;
  final String createdTime;
  final String lastEditedTime;
  final ObjectIdUnion createdBy;
  final ObjectIdUnion lastEditedBy;
  final Cover? cover;
  final Icon? icon;
  final Parent parent;
  final bool archived;
  final String url;
  final T properties;
}

class ObjectIdUnion {
  ObjectIdUnion.fromJson(Map<String, dynamic> json)
      : object = json['object'] as String,
        id = json['id'] as String;
  final String object;
  final String id;
}

class Cover {
  Cover.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String,
        external =
            UrlContainer.fromJson(json['external'] as Map<String, String>);
  final String type;
  final UrlContainer external;
}

class UrlContainer {
  UrlContainer.fromJson(Map<String, dynamic> json)
      : url = json['url'] as String;
  final String url;
}

class Icon {
  Icon.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String,
        emoji = json['emoji'] as String;

  final String type;
  final String emoji;
}

class Parent {
  Parent.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String,
        databaseId = json['database_id'] as String;
  final String type;
  final String databaseId;
}
