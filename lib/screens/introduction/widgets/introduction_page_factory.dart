import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPageFactory{

  static PageViewModel _firstIntroductionPage = PageViewModel(
      title: 'First Introduction Page Title',
      body: 'This is the body of the introduction page',
      image: Center(
        child: Image.network("https://images.unsplash.com/photo-1547190027-9156686aa2f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80", height: 175.0),
      ),
  );

  static PageViewModel _secondIntroductionPage = PageViewModel(
      title: 'Second Introduction Page Title',
      body: 'This is the body of the introduction page second',
      image: Center(
        child: Image.network("https://images.unsplash.com/photo-1547190027-9156686aa2f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80", height: 175.0),
      ),
  );

  static  List<PageViewModel> get introductionPages => [_firstIntroductionPage, _secondIntroductionPage];

}



