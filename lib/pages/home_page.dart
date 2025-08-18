import 'package:flutter/material.dart';
import 'package:flutter_music_player/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Center(
          child: Text("P L A Y L I S T", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: MyDrawer(),
    );
  }
}
