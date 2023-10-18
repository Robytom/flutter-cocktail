import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Cocktails App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomCocktailPage(),
    );
  }
}

class RandomCocktailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Cocktail'),
      ),
      body: Center(
        child: Text('Press the button to load a random cocktail!'),
      ),
    );
  }
}