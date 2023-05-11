import 'package:equatable/equatable.dart';

class ShareJobModel extends Equatable {
  final String? url;
  final String msg;

  const ShareJobModel({
    this.url,
    required this.msg,
  });
  @override
  List<Object?> get props => [url, msg];
}
