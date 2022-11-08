import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import './login.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of first page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child: Lottie.asset("assets/lotties/1.json"),
          ),
        ),
        PageViewModel(
          title: "Title of second page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child: Lottie.asset("assets/lotties/2.json"),
          ),
        )
      ],
      done: const Text("Login", style: TextStyle(fontWeight: FontWeight.w600)),
      showNextButton: true,
      next: Text("Next"),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }
}
