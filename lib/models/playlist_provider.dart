import 'package:flutter/material.dart';
import 'song.dart';

class PlaylistProvider extends ChangeNotifier {
  //Playlist of songs
  final List<Song> _playlist = [
    Song(
      songName: "Celeste - 08 Scattered and Lost",
      artistName: "Lena Raine",
      albumArtImagePath: "assets/images/celeste.jpeg",
      audioPath: "assets/audio/celeste8.mp3",
    ),
    Song(
      songName: "TUNIC - 02 Memories of Memories",
      artistName: "Liifeformed",
      albumArtImagePath: "assets/images/tunic.jpg",
      audioPath: "assets/audio/tunic2.mp3",
    ),
  ];

  int? _currentSongIndex;

  //GETTERS
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //SETTERS

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    notifyListeners();
  }
}
