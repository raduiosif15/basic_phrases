import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicPhrases());
}

class BasicPhrases extends StatefulWidget {
  const BasicPhrases({Key? key}) : super(key: key);

  @override
  _BasicPhrasesState createState() => _BasicPhrasesState();
}

class _BasicPhrasesState extends State<BasicPhrases> {
  final List<String> _soundsMap = <String>[
    'salut',
    'ce faci',
    'cum esti',
    'sunt bine',
    'ma numesc',
  ];
  final AudioPlayer _audioPlayer = AudioPlayer();
  late AudioCache _audioCache;

  @override
  void initState() {
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.release();
    _audioPlayer.dispose();
    _audioCache.clearAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Basic phrases',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          elevation: 0.0,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: _soundsMap.length * 2,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async {
                  String fileName =
                      index.isEven ? _soundsMap.elementAt(index ~/ 2) : _soundsMap.elementAt((index - 1) ~/ 2);
                  fileName = fileName.replaceAll(' ', '_');
                  if (index.isEven) {
                    await _audioCache.play('romanian/$fileName.mp3');
                  } else {
                    await _audioCache.play('german/$fileName.mp3');
                  }

                  await _audioCache.clearAll();
                },
                child: index.isEven
                    ? Text(
                        _soundsMap.elementAt(index ~/ 2),
                        style: const TextStyle(fontSize: 25.0),
                      )
                    : Text(
                        '${_soundsMap.elementAt((index - 1) ~/ 2)} (germana)',
                        style: const TextStyle(fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber,
              ),
            );
          },
        ),
      ),
    );
  }
}
