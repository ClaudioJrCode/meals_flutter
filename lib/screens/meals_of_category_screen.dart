import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import '../models/meals.dart';

class MealsOfCategoryScreen extends StatelessWidget {
  final List<Meal> meals;

  const MealsOfCategoryScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final mealsOfCategory = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: mealsOfCategory.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            mealsOfCategory[index],
          );
        },
      ),
    );
  }
}
