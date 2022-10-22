import 'package:flutter/material.dart';
import 'package:meal/widget/drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function setFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.setFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten']!;
    vegetarian = widget.currentFilters['vegetarian']!;
    vegan = widget.currentFilters['vegan']!;
    lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget buildSwitchTile(
      String title, String subtitle, var type, var changedvalue) {
    return SwitchListTile(
      value: type,
      title: Text(title, style: const TextStyle(fontSize: 20)),
      subtitle: Text(subtitle),
      onChanged: changedvalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> filters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian
              };

              widget.setFilters(filters);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          child: const Text(
            'Modify Your Choices',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 30,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              buildSwitchTile(
                'Gluten-Free',
                'only include gluten-free meals',
                glutenFree,
                (newvalue) {
                  setState(
                    () {
                      glutenFree = newvalue;
                    },
                  );
                },
              ),
              buildSwitchTile(
                'Vegetarian',
                'only include vegetarian meals',
                vegetarian,
                (newvalue) {
                  setState(
                    () {
                      vegetarian = newvalue;
                    },
                  );
                },
              ),
              buildSwitchTile(
                'Vegan',
                'only include vegan meals',
                vegan,
                (newvalue) {
                  setState(
                    () {
                      vegan = newvalue;
                    },
                  );
                },
              ),
              buildSwitchTile(
                'Lactose-Free',
                'only include lactose-free meals',
                lactoseFree,
                (newvalue) {
                  setState(
                    () {
                      lactoseFree = newvalue;
                    },
                  );
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
