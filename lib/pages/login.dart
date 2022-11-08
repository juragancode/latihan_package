import 'package:flutter/material.dart';
import 'package:latihan_package/pages/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "email",
              border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(35),
                  ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: "password",
              border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(35),
                  ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            },
            child: Text("login"),
          ),
        ],
      ),
    );
  }
}
