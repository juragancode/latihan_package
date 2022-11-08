import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Introduction Screen & Lottie"),
      ),
      body: Center(
        child: AvatarGlow(
          glowColor: Colors.teal,
          endRadius: 200.0,
          child: Material(
            // Replace this child with your own
            elevation: 8.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[400],
              backgroundImage: NetworkImage('https://picsum.photos/400'),
              radius: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}
