import 'package:flutter/material.dart';
import "../../data/mock_grocery_repository.dart";
import "../../models/grocery.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  final _searchingTextController = TextEditingController();
  late List<Grocery> _filterList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchingTextController,
          onChanged: (value) {
            _filterList = [];
            setState(() {
              for (int i = 0; i < dummyGroceryItems.length; i++) {
                if (dummyGroceryItems[i].name.startsWith(value.toUpperCase())) {
                  _filterList.add(dummyGroceryItems[i]);
                }
              }
            });
          },
        ),
        _filterList.isEmpty
            ? Text("")
            : Expanded(
                child: ListView.builder(
                  itemCount: _filterList.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: Container(
                        width: 15,
                        height: 15,
                        color: _filterList[index].category.color,
                      ),
                      title: Text(_filterList[index].name),
                      trailing: Text(_filterList[index].quantity.toString()),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
