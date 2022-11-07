import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Faker"),
      ),
      body: ListView.builder(
        itemCount: 35,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade400,
            // backgroundImage: NetworkImage(faker.image.image(random: true)),
            backgroundImage: NetworkImage(
                "https://picsum.photos/${200 + index}/${300 + index}"),
          ),
          title: Text("${faker.person.name()}"),
          subtitle: Text(
              "${DateFormat.yMMMMEEEEd().add_ms().format(DateTime.now())}"),
        ),
      ),
    );
  }
}
