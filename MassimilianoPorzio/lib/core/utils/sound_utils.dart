import 'package:audioplayers/audioplayers.dart';

import '../services/service_locator.dart';

void playSound({required String file}) async {
  var player = sl<AudioPlayer>();

  player.play(AssetSource(file));
}
