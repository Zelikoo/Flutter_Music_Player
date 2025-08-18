import 'package:flutter/material.dart';
import 'package:flutter_music_player/components/neu_box.dart';
import 'package:provider/provider.dart';
import 'package:flutter_music_player/models/playlist_provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get playlist
        final playlist = value.playlist;

        //get current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];

        //return Scaffold
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back),
                      ),
                      Text("P L A Y L I S T"),
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // album artwork
                  NeuBox(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(8),
                          child: Image.asset(currentSong.albumArtImagePath),
                        ),

                        SizedBox(height: 10),

                        //song and artist name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(currentSong.artistName),
                              ],
                            ),
                            Icon(Icons.favorite, color: Colors.red),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  //song duration progress
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Start time and end time
                            Text("0:00"),
                            //shuffle
                            Icon(Icons.shuffle),
                            //repeat
                            Icon(Icons.repeat),

                            //end time
                            Text("10:00"),
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0,
                          ),
                        ),
                        child: Slider(
                          min: 0,
                          max: 100,
                          value: 50,
                          activeColor: Colors.green,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0),
                  //playback control
                  Row(
                    children: [
                      //skip
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: NeuBox(child: Icon(Icons.skip_previous)),
                        ),
                      ),

                      SizedBox(width: 20),
                      //play
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {},
                          child: NeuBox(child: Icon(Icons.play_arrow)),
                        ),
                      ),

                      SizedBox(width: 20),
                      //skip forward
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: NeuBox(child: Icon(Icons.skip_next)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
