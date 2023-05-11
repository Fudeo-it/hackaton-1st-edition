import 'package:equatable/equatable.dart';

class JobUrlModel extends Equatable {
  final String? url;

  const JobUrlModel({
    this.url,
  });

  @override
  List<Object?> get props => [url];
}
