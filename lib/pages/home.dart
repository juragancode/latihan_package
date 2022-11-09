import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;

import '../models/province.dart';
import '../models/city.dart';

class HomePage extends StatelessWidget {
  String? idProv;

  final String apiKey =
      "34e19b5eb30a7db14e5be385b9487a530b7b9bc2dd05b18b1fa1779b13d75de3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dropdown API"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
            // mode: Mode.MENU,
            onChanged: (value) => idProv = value?.id,
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Please Select Province!"),
            showSearchBox: true,
            popupItemBuilder: (context, item, isSelected) => ListTile(
              title: Text(item.name),
            ),
            // selectedItem: "Brazil",
            onFind: (text) async {
              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"));
              if (response.statusCode != 200) {
                return [];
              }
              List allProvince =
                  (jsonDecode(response.body) as Map<String, dynamic>)["value"];

              List<Province> allModelProvince = [];
              allProvince.forEach((element) {
                allModelProvince.add(
                  Province(
                    id: element["id"],
                    name: element["name"],
                  ),
                );
              });
              return allModelProvince;
            },
          ),
          SizedBox(height: 20),
          DropdownSearch<City>(
            // mode: Mode.MENU,
            onChanged: (value) => print(value?.toJson()),
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? "Please Select City!"),
            showSearchBox: true,
            popupItemBuilder: (context, item, isSelected) => ListTile(
              title: Text(item.name),
            ),
            // selectedItem: "Brazil",
            onFind: (text) async {
              var response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProv"));
              if (response.statusCode != 200) {
                return [];
              }
              List allCity =
                  (jsonDecode(response.body) as Map<String, dynamic>)["value"];

              List<City> allModelCity = [];
              allCity.forEach((element) {
                allModelCity.add(
                  City(
                    id: element["id"],
                    idProvinsi: element["id_provinsi"],
                    name: element["name"],
                  ),
                );
              });
              return allModelCity;
            },
          ),
        ],
      ),
    );
  }
}
