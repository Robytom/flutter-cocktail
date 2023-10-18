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
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail['strDrink']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Ingredients:'),
            ...ingredientWidgets,
            SizedBox(height: 20),
            Text('Recipe:'),
            Text(cocktail['strInstructions']),
          ],
        ),
      ),
    );
  }
}
