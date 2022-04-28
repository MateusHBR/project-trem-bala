import 'package:just_audio/just_audio.dart';

import 'music_player_gateway.dart';

class JustAudioPlayer implements MusicPlayerGateway {
  JustAudioPlayer({
    required this.justAudio,
  });

  final AudioPlayer justAudio;

  @override
  Future<void> play() async {
    await justAudio.play();
  }

}
