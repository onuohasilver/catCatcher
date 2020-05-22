  import 'package:audioplayers/audio_cache.dart';

void playSound() {
    final player = AudioCache();
    player.play('meow.wav');
  }
