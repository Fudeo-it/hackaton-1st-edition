import 'package:rxdart/rxdart.dart';

class RxHelper {
  /// Allows to debounce only certain events of the stream
  static Stream<T> maybeDebounceEvents<T>({required Stream<T> events, required bool Function(T event) test, required Duration debounceTime}) {
    final debouncedEvents = events
      .where((event) => test(event))
      .debounceTime(debounceTime)
      .distinct();

    final forwardedEvents = events
      .where((event) => !test(event));

    return forwardedEvents.mergeWith([debouncedEvents]);
  }
}