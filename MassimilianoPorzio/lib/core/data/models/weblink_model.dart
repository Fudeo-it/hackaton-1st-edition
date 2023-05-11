import 'dart:convert';

import 'package:equatable/equatable.dart';

class WebLinkModel extends Equatable {
  final String content;
  final String? url;
  const WebLinkModel({
    required this.content,
    this.url,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'content': content});
    if (url != null) {
      result.addAll({'url': url});
    }

    return result;
  }

  factory WebLinkModel.fromJson(Map<String, dynamic> json) {
    return WebLinkModel(
      content: json['content'] ?? '',
      url: json['url'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [content, url];
}
