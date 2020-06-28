import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routerName = '/filter_screen';
  Function saveFilters;
  Map<String, bool> currentFilters;

  FilterScreen(this.saveFilters, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    // TODO: implement initState
    super.initState();
  }

  void setFilters(){
    Map<String, bool> filterData = {
      'gluten' : _glutenFree,
      'lactose' : _lactoseFree,
      'vegan' : _vegan,
      'vegetarian' : _vegetarian
    };
    widget.saveFilters(filterData);
  }
  

  Widget _buildSwitchListTile(
    String title,
 
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: setFilters,)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free', 'Only include gluten-free meal', _glutenFree, (newValue){
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile('Vegetarian', 'Only include Vegerarian meal', _vegetarian, (newValue){
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile('Vegan', 'Only include vegan meal', _vegan, (newValue){
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile('Lactose-free', 'Only include Lactose-free meal', _lactoseFree, (newValue){
                  setState(() {
                    _lactoseFree = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
