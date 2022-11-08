import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            child: SvgPicture.network(
                "https://www.svgrepo.com/show/429857/grass-land-leaves.svg",
                height: 175.0),
          ),
        ),
        PageViewModel(
          title: "Title of second page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child: SvgPicture.network(
                "https://www.svgrepo.com/show/429854/mountain-nature-snow.svg",
                height: 175.0),
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
