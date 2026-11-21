import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class AudioManager extends Component{
  bool musicEnabled = true;
  bool soundsEnabled = true;

  final List<String> sounds = [
    'click',
    'collect',
    'explode1',
    'explode2',
    'fire',
    'hit',
    'laser',
    'start'
  ];


  @override
  FutureOr<void> onLoad()  async{
    await FlameAudio.bgm.initialize();
    for (final s in sounds) {
      FlameAudio.audioCache.load('$s.ogg');
    }
    return super.onLoad();
  }

  void playMusic(){
    if(musicEnabled){
      FlameAudio.bgm.play('music.ogg');
    }
  }

  void toggleMusic(){
    musicEnabled = !musicEnabled;
    if(musicEnabled){
      playMusic();
    }
    else{
      FlameAudio.bgm.stop();
    }
  }

  void toggleSounds(){
    soundsEnabled = !soundsEnabled;

  }

  void playSound(String name) {
    if (soundsEnabled) {
      FlameAudio.play('$name.ogg');
    }
  }
}