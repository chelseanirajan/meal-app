import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget{
  static const routerName = '/category-meals';
  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);
  @override
  State<StatefulWidget> createState() {
    return CategoryMealsScreenState();
  }

}
class CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
 late List<Meal> displayMeals;
 var _loadedInitalData = false;

  void initState(){

  }
  void didChangeDependencies(){
    if(!_loadedInitalData){
      final routeArgs = ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'] as String;
      displayMeals = widget.availableMeal.where((meal) =>
          meal.categories.contains(categoryId)).toList();
      _loadedInitalData = true;
    }

  }

  void _removeMeal(String mealId){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].durations,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            removeItem: _removeMeal,);
        // Text(displayMeals[index].title);
      }, itemCount: displayMeals.length,),
    );
  }

}
