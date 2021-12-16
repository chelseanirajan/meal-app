import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabScreenState();
  }
}

class TabScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
  {'page': CategoriesScreen(), 'title':'Category'},
{'page': FavoriteScreen(), 'title': 'Favorite'}
  ];
 int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        // bottom: TabBar(
        //   tabs: [
        //     Tab(icon: Icon(Icons.category), text: 'Category'),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: 'faorite',
        //     )
        //   ],
        // ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      // TabBarView(
      //   children: [
      //     CategoriesScreen(),
      //     FavoriteScreen(),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorite'),
          )
        ],
      ),
    );
    //   DefaultTabController(
    //   length: 2,
    //   child:
    //
    // );
  }
}
