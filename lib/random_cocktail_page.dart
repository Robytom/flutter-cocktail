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
          _cocktailName == null
              ? Container()
              : Text(
                  _cocktailName,
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
              child: _cocktailImage == null
                  ? Container()
                  : Image.network(_cocktailImage),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipePage()),
                );
              },
              child: Text('Recipe and Ingredients'),
            ),
          ],
        ),
      ),
    );
  }
  
  String _cocktailName = 'Cocktail Name';
  String _cocktailImage = 'https://www.thecocktaildb.com/images/logo.png';

  // Function to fetch a random cocktail
  void _fetchRandomCocktail() async {
  var url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php');
  var response = await http.get(url);

  var data = json.decode(response.body);
  setState(() {
    _cocktailImage = data['drinks'][0]['strDrinkThumb'];
    _cocktailName = data['drinks'][0]['strDrink'];
  });
}
}