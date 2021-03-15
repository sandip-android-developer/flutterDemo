import 'package:flutter/material.dart';
import 'package:flutter_app/screens/SignInScreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro screen'),
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showNextButton: true,
        showSkipButton: true,
        skip: Text("Skip"),
        next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
        done: Text("Got it"),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
        },
      ),
    );
  }

  List<PageViewModel> getPages() {
    List<String> litems = ["1", "2", "Third", "4"];
    List<PageViewModel> listArray = List<PageViewModel>();
    for (int i = 0; i < 3; i++)
    {
      listArray.add(PageViewModel(
          image: Image.asset('assets/images/flutter-logo.png'),
          title: "Live Demo page $i",
          body: "Welcome to Sandroid new Application page $i"));
    }
    return listArray;

    /* PageViewModel(
          image: Image.asset('assets/images/flutter-logo.png'),
          title: "Live Demo page 2",
          body: "Welcome to Sandroid new Application page 2"),
      PageViewModel(
          image: Image.asset('assets/images/flutter-logo.png'),
          title: "Live Demo page 3",
          body: "Welcome to Sandroid new Application page 3");*/
  }
}
