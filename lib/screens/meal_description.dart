import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';

class MealDescription extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  MealDescription(this.onToggleFavorite, this.isFavorite);
  Widget _createTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createCardContainer(Meal meal, Widget child) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(30),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: meal.ingredients.length * 45,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    final eachIngredient = meal.ingredients.map((ing) {
      return ing;
    });
    print(eachIngredient.runtimeType);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(0),
                height: 300,
                width: double.infinity,
                child: Image.network(meal.imgUrl)),
            _createTitle(context, 'Ingredients'),
            _createCardContainer(
                meal,
                ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(meal.ingredients[index]),
                          ),
                          color: Theme.of(context).accentColor);
                    })),
            _createTitle(context, 'Cook Steps'),
            _createCardContainer(
              meal,
              ListView.builder(
                itemCount: meal.cookSteps.length,
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            '${i + 1}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        title: Text(meal.cookSteps[i]),
                      ),
                      Divider(color: Colors.black),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          splashColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).primaryColor,
          child: isFavorite(meal)
              ? Icon(
                  Icons.favorite,
                  color: Theme.of(context).accentColor,
                )
              : Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).accentColor,
                ),
          onPressed: () {
            onToggleFavorite(meal);
          }),
    );
  }
}
