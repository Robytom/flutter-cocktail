import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipe_page.dart';

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
            SizedBox(height: 20),
            // Add a container to display the cocktail name
            _currentCocktail == null
                ? Container()
                : Text(
                    _currentCocktail!['strDrink'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
            SizedBox(height: 20),
            // Add a container to display the cocktail image
            Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: _currentCocktail == null
                    ? Image.network(
                        'https://www.thecocktaildb.com/images/logo.png')
                    : Image.network(_currentCocktail!['strDrinkThumb'])),
            SizedBox(height: 20),
            if (_currentCocktail != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RecipePage(cocktail: _currentCocktail!)),
                  );
                },
                child: Text('Recipe and Ingredients'),
              ),
          ],
        ),
      ),
    );
  }

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
}
