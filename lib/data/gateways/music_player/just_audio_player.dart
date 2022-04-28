import 'package:just_audio/just_audio.dart';

import 'music_player_gateway.dart';

class JustAudioPlayer implements MusicPlayerGateway {
  JustAudioPlayer({
    required this.justAudio,
  });

  final AudioPlayer justAudio;

  @override
  Future<void> pause() async {
    await justAudio.pause();
  }

  @override
  Future<void> play() async {
    await justAudio.play();
  }

  @override
  Future<void> seek({required Duration position}) async {
    await justAudio.seek(position);
  }

}
