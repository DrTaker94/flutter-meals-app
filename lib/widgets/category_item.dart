import 'package:flutter/material.dart';

import 'package:meals_app_udemy/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  // # Using push to screen the CategoryMealsScreen
  // # push() navigates to a new screen by creating it "on the fly
  // # push() creates the MaterialPageRoute object "on the fly" (i.e. in the place where you call push())
  // void selectCategory(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return CategoryMealsScreen(id, title);
  //       },
  //     ),
  //   );
  // }

  // # Using pushNamed to screen the routes named in main file
  // # pushNamed() can only load screens which were registered in advance
  // # pushNamed() only works with pre-registered routes (in the routes table of your MaterialApp widget)
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme
            .of(context)
            .primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme
                .of(context)
                .textTheme
                .headline6,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
    }
  }
