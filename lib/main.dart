import 'package:flutter/material.dart';

import 'package:meals/screens/meal_description.dart';
import 'package:meals/screens/meals_of_category_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_route.dart';
import './models/settings.dart';
import './data/dummy_data.dart';
import 'models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeal = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        var filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        var filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        var filterVegan = settings.isVegan && !meal.isVegan;
        var filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterVegetarian &&
            !filterGluten &&
            !filterLactose &&
            !filterVegan;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoritesMeal.contains(meal)
          ? _favoritesMeal.remove(meal)
          : _favoritesMeal.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoritesMeal.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primaryColor: Colors.pink[400],
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 234, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6:
                  TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'))),
      routes: {
        AppRoute.HOME: (ctx) => TabsScreen(_favoritesMeal),
        AppRoute.MEALS_CATEGORY: (ctx) =>
            MealsOfCategoryScreen(_availableMeals),
        AppRoute.MEAL_DESCRIPTION: (ctx) => MealDescription(_toggleFavorite, _isFavorite),
        AppRoute.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals)
      },
      onGenerateRoute: (settings) {},
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
