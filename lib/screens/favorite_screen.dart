import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meals.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;
  FavoriteScreen(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('You don´t Select Favorite Foods Yet!!'),
            ),
            Center(
              child: Text('Click on HEARTS to Fav!'),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoritesMeal.length,
        itemBuilder: (context, item) {
          return MealItem(favoritesMeal[item]);
        },
      );
    }
  }
}
