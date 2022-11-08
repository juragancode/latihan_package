import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  List<Map<String, dynamic>> dataList = [
    {
      "country": "Brazil",
      "id": 1,
    },
    {
      "country": "Italia",
      "id": 2,
    },
    {
      "country": "Tunisia",
      "id": 3,
    },
    {
      "country": "Canada",
      "id": 4,
    },
    {
      "country": "Rusia",
      "id": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dropdown Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: DropdownSearch<Map<String, dynamic>>(
          mode: Mode.MENU,
          items: dataList,
          // popupItemDisabled: (String s) => s.startsWith('I'),
          onChanged: (value) => print(value?["id"] ?? null),
          selectedItem: {
            "country": "Brazil",
            "id": 1,
          },
          showSearchBox: true,
          // showClearButton: true,
          popupItemBuilder: (context, item, isSelected) => ListTile(
            title: Text(item["country"].toString()),
          ),
          dropdownBuilder: (context, selectedItem) => Text(
              selectedItem?["country"].toString() ?? "Please choise country!"),
        ),
      ),
    );
  }
}
