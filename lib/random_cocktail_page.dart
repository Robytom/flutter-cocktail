import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipe_page.dart';

class RandomCocktailPage extends StatefulWidget {
  @override
  _RandomCocktailPageState createState() => _RandomCocktailPageState();
}

class _RandomCocktailPageState extends State<RandomCocktailPage> {
  Map<String, dynamic>? _currentCocktail;

  // Function to fetch a random cocktail
  void _fetchRandomCocktail() async {
    var url =
        Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php');
    var response = await http.get(url);

    var data = json.decode(response.body);
    setState(() {
      _currentCocktail = data['drinks'][0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Cocktail'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the button to load a random cocktail!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchRandomCocktail,
              child: Text('Random Cocktail'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 40),
            if (_currentCocktail != null) ...[
              Text(
                _currentCocktail!['strDrink'],
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.brown[700],
                ),
                child: Image.network(_currentCocktail!['strDrinkThumb']),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipePage(cocktail: _currentCocktail!),
                    ),
                  );
                },
                child: Text('Recipe and Ingredients'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
              ),
            ] else ...[
              Container(
                height: 200,
                width: 200,
                child: Image.network(
                  'https://www.thecocktaildb.com/images/logo.png',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
