import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import '../utils/app_route.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal);

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoute.MEAL_DESCRIPTION,
      arguments: meal,
    )
        .then((res) {
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      //InkWell Basicamente transforma em um botão o Widget filho
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(meal.imgUrl,
                        height: 250, width: double.infinity)),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    // alignment: Alignment.center,
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(children: [
                    Icon(Icons.bar_chart),
                    SizedBox(width: 6),
                    Text(meal.complexityText)
                  ]),
                  Row(children: [
                    Icon(Icons.monetization_on_outlined),
                    SizedBox(width: 6),
                    Text(meal.costText),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
