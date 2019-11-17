import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyFirstPage());

class MyFirstPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    final wordPair = WordPair.random();
//    return MaterialApp(
//      title: 'Welcome to Flutter',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter'),
//          centerTitle: true,
//        ),
//        body: Center(
////          child: Text('Hello World'),
////          child: Text(wordPair.asPascalCase),
//          child: RandomWords(),
//        ),
//      ),
//    );
//  }

  /**
   * listview列表
   */
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'StartUp Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),

    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final pair = WordPair.random();
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
}
