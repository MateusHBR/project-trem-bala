import 'package:just_audio/just_audio.dart';

import 'music_player_gateway.dart';

class JustAudioPlayer implements MusicPlayerGateway {
  JustAudioPlayer({
    required this.justAudio,
  });

  final AudioPlayer justAudio;

  @override
  Future<Duration?> loadAudio({required String path}) async {
    return await justAudio.setAsset(path);
  }

  @override
  Future<void> loadPlaylist({
    required List<String> audioPaths,
    int initialIndex = 0,
  }) async {
    final audioSource = audioPaths
        .map((assetPath) => AudioSource.uri(Uri.parse('asset:///$assetPath')))
        .toList();

    await justAudio.setAudioSource(
      ConcatenatingAudioSource(children: audioSource),
      initialIndex: initialIndex,
    );
  }

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

  @override
  Future<void> stop() async {
    await justAudio.stop();
  }
}
