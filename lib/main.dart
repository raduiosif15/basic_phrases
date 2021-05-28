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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Haus'),
        ),
        body: const Center(
          child: Text('Haus'),
        ),
      ),
    );
  }
}
