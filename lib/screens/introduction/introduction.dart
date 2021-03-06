import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

import './widgets/introduction_page_factory.dart';

class AppIntroductionScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    List<PageViewModel> _introductionPagesList = IntroductionPageFactory.introductionPages;

    IntroductionScreen appIntroScreen = IntroductionScreen(
      pages: _introductionPagesList,
      done: const Text("Get Started", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () {
        Navigator.pushNamed(context, '/login');
      },
      showNextButton: false,
      showSkipButton: false,
    );

    return appIntroScreen;
  }


}


