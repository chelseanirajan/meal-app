import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filter-screen';
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(this.currentFilter,this.saveFilters);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FiltersScreenState();
  }
}

class FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  initState(){
    _glutenFree = widget.currentFilter['gluten']??true;
    _lactoseFree = widget.currentFilter['lactose'] ??true;
    _vegetarian = widget.currentFilter['vegeterian'] ??true;
    _vegan = widget.currentFilter['vegan'] ??true;
  }

  Widget _buildSwitchListTile(String title, String subTitle, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterain': _vegetarian,
              };
              widget.saveFilters(selectedFilter);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-Free', 'Only include gluten-free meal', _glutenFree,
                    (newValue1) {
                  setState(() {
                    _glutenFree = newValue1;
                  });
                }),
                _buildSwitchListTile('Lactos-Free',
                    'Only include Lactos-free meal', _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegeterian ', 'Only include Vegeterian meal', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile('Vegan', 'Only include Vegan meal', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
