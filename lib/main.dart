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

class RandomCocktailPage extends StatefulWidget {
  @override
  _RandomCocktailPageState createState() => _RandomCocktailPageState();
}

class _RandomCocktailPageState extends State<RandomCocktailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Cocktail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Press the button to load a random cocktail!'),
            ElevatedButton(
              onPressed: _fetchRandomCocktail,
              child: Text('Random Cocktail'),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: _cocktailImage == null
                  ? Container()
                  : Image.network(_cocktailImage),
            ),
          ],
        ),
      ),
    );
  }

  String _cocktailImage = 'https://www.thecocktaildb.com/images/logo.png';

  // Function to fetch a random cocktail
  void _fetchRandomCocktail() {
    // Implement API call here
  }
}