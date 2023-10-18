import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final Map<String, dynamic> cocktail;

  RecipePage({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    List<Widget> ingredientWidgets = [];

    for (int i = 1; i <= cocktail.length; i++) {
      String? ingredient = cocktail['strIngredient$i'];
      String? measure = cocktail['strMeasure$i'];

      if (ingredient != null && ingredient.isNotEmpty) {
        ingredientWidgets.add(
          Text(
            measure != null ? '$ingredient : $measure' : ingredient,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail['strDrink']),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            ...ingredientWidgets,
            SizedBox(height: 20),
            Text(
              'Recipe:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                cocktail['strInstructions'],
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
