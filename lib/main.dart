import 'package:flutter/material.dart';
import 'random_cocktail_page.dart';

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