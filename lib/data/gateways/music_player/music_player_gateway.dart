abstract class MusicPlayerGateway {
  Future<void> play();
  Future<void> pause();
  Future<void> seek({required Duration position});
}
