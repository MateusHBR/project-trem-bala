abstract class MusicPlayerGateway {
  Future<Duration?> loadAudio({required String path});
  Future<void> play();
  Future<void> pause();
  Future<void> seek({required Duration position});
  Future<void> stop();
}
