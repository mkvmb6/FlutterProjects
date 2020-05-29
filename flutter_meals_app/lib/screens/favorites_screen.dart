import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favourites;

  FavouritesScreen(this._favourites);

  @override
  Widget build(BuildContext context) {
    if (_favourites.isEmpty) {
      return Center(
        child: Text('You have no favourites'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var meal = _favourites[index];
          return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              affordability: meal.affordability,
              complexity: meal.complexity,
              duration: meal.duration);
        },
        itemCount: _favourites.length,
      );
    }
  }
}
