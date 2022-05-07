abstract class MusicPlayerGateway {
  Future<Duration?> loadAudio({required String path});
  Future<void> loadPlaylist({
    required List<String> audioPaths,
    int initialIndex = 0,
  });
  Future<void> play();
  Future<void> pause();
  Future<void> seek({required Duration position});
  Future<void> stop();
}
