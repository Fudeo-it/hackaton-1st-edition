import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  final VoidCallback action;
  Timer? timer;

  Debouncer(
    this.action,
    this.timer, {
    required this.milliseconds,
  });

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();

      timer = Timer(Duration(milliseconds: milliseconds), action);
    }
  }
}
