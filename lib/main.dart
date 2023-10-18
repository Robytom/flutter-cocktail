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
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFb68f4f), // Whiskey color
      ),
      home: RandomCocktailPage(),
    );
  }
}
