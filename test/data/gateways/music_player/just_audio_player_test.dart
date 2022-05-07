import 'package:just_audio/just_audio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:project_trem_bala/data/gateways/music_player/just_audio_player.dart';

class AudioPlayerMock extends Mock implements AudioPlayer {}

class AudioSourceMock extends Mock implements AudioSource {}

void main() {
  group('Play', () {
    final playerMock = AudioPlayerMock();

    setUp(() {
      when(() => playerMock.play()).thenAnswer((_) async {});
    });

    tearDown(() {
      reset(playerMock);
    });

    test('should call play properly', () async {
      final sut = JustAudioPlayer(
        justAudio: playerMock,
      );

      await sut.play();

      verify(() => playerMock.play()).called(1);
    });
  });

  group('Pause', () {
    final playerMock = AudioPlayerMock();

    setUp(() {
      when(() => playerMock.pause()).thenAnswer((_) async {});
    });

    tearDown(() {
      reset(playerMock);
    });

    test('should call pause properly', () async {
      final sut = JustAudioPlayer(
        justAudio: playerMock,
      );

      await sut.pause();

      verify(() => playerMock.pause()).called(1);
    });
  });

  group('Seek', () {
    final playerMock = AudioPlayerMock();

    setUp(() {
      when(() => playerMock.seek(any())).thenAnswer((_) async {});
    });

    tearDown(() {
      reset(playerMock);
    });

    test('should call seek properly', () async {
      final sut = JustAudioPlayer(
        justAudio: playerMock,
      );

      await sut.seek(position: const Duration(seconds: 1));
      await sut.seek(position: const Duration(seconds: 3));

      verify(() => playerMock.seek(const Duration(seconds: 1))).called(1);
      verify(() => playerMock.seek(const Duration(seconds: 3))).called(1);
    });
  });

  group('Stop', () {
    final playerMock = AudioPlayerMock();

    setUp(() {
      when(() => playerMock.stop()).thenAnswer((_) async {});
    });

    tearDown(() {
      reset(playerMock);
    });

    test('should call stop properly', () async {
      final sut = JustAudioPlayer(
        justAudio: playerMock,
      );

      await sut.stop();

      verify(() => playerMock.stop()).called(1);
    });
  });

  group('Load Audio', () {
    final playerMock = AudioPlayerMock();

    setUp(() {
      when(() => playerMock.setAsset(any())).thenAnswer((_) async => null);
    });

    tearDown(() {
      reset(playerMock);
    });

    test('should call setAsset properly', () async {
      final sut = JustAudioPlayer(
        justAudio: playerMock,
      );

      await sut.loadAudio(path: 'some path');

      verify(() => playerMock.setAsset('some path')).called(1);
    });
  });

  group('Load audio playlist', () {
    final playerMock = AudioPlayerMock();

    setUp(() {
      registerFallbackValue(AudioSourceMock());

      when(
        () => playerMock.setAudioSource(
          any(),
          initialIndex: any(named: 'initialIndex'),
        ),
      ).thenAnswer((_) async => null);
    });

    tearDown(() {
      reset(playerMock);
    });

    test('should call setAudioSource properly', () async {
      final sut = JustAudioPlayer(
        justAudio: playerMock,
      );

      await sut.loadPlaylist(audioPaths: ['audio1.mp3', 'audio2.mp3']);

      await sut.loadPlaylist(
        audioPaths: ['audio1.mp3', 'audio2.mp3'],
        initialIndex: 1,
      );

      verify(
        () => playerMock.setAudioSource(any(), initialIndex: 0),
      ).called(1);

      verify(
        () => playerMock.setAudioSource(any(), initialIndex: 1),
      ).called(1);
    });
  });
}
