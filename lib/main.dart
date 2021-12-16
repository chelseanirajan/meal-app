import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'model/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<Meal> _avialableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
        _filters = filterData;
        var a = _filters['gluten'];
      _avialableMeals = DUMMY_MEALS.where((meal) {
      if ( _filters['gluten'] && !meal.isLactoseFree){
        return false;
      }
      if (_filters['lactose']  && !meal.isLactoseFree){
        return false;
      }
      if (_filters['vegan']  && !meal.isVegan){
        return false;
      }
      if (_filters['vegeterian']??true && !meal.isVegetarian){
        return false;
      }
          return true;
      }
      ).toList();

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Milk',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routerName: (ctx) =>
            CategoryMealsScreen(_avialableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters)
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if(settings.name == '/meal-details'){
        //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        // }else (){
        //
        // }
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
// class MyHomePage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return MyAppState();
//   }
//
// }
// class MyAppState extends State<MyHomePage>{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Daily meal'),
//         ),
//         body: Center(
//           child: Text('This is the body of meal'),
//         ),
//       ),
//     );
//   }
//
// }
