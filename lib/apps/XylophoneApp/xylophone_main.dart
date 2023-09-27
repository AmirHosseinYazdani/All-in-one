import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.black45, Colors.black26]),
          ),
          child: Column(
            children: [
              drawPlayBtn(color: Colors.redAccent, soundNum: 1),
              drawPlayBtn(color: Colors.orangeAccent, soundNum: 2),
              drawPlayBtn(color: Colors.yellowAccent, soundNum: 3),
              drawPlayBtn(color: Colors.greenAccent, soundNum: 4),
              drawPlayBtn(color: Colors.blueAccent, soundNum: 5),
              drawPlayBtn(color: Colors.pinkAccent, soundNum: 6),
              drawPlayBtn(color: Colors.purpleAccent, soundNum: 7),
            ],
          ),
        ),
      ),
    );
  }

  void playSound(int? id) {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/note_sounds/note$id.wav"),
      autoStart: true,
      showNotification: true,
    );
  }

  Expanded drawPlayBtn({Color? color, int? soundNum}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.all(8)),
        onPressed: () {
          playSound(soundNum);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
