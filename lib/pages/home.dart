import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = new Faker();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ListView.builder(
        itemCount: 35,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              // backgroundImage: NetworkImage(faker.image.image(random: true)),
              backgroundImage: NetworkImage(
                  "https://picsum.photos/${200 + index}/${300 + index}")),
          title: Text("${faker.person.name()}"),
          subtitle: Text(
              "${DateFormat.yMMMMEEEEd().add_ms().format(DateTime.now())}"),
        ),
      ),
      Center(child: Text("Discovery", style: TextStyle(fontSize: 35))),
      Center(child: Text("Add", style: TextStyle(fontSize: 35))),
      Center(child: Text("Message", style: TextStyle(fontSize: 35))),
      Center(child: Text("Profile", style: TextStyle(fontSize: 35))),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Bitch!"),
      ),
      body: widgets[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        // style: TabStyle.reactCircle,
        backgroundColor: Colors.teal,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
