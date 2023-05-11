enum LoadingStatus {
  initial, inProgress, done, error
}

class LoadingState<T> {
  final LoadingStatus status;
  final List<T>? items;
  final dynamic error;

  const LoadingState({ this.status = LoadingStatus.initial, this.items, this.error });
}