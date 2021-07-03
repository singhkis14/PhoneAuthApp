import 'package:flutter/material.dart';
import 'package:habit_o_meter/screens/error/error.dart';
import 'package:habit_o_meter/screens/home/home.dart';
import 'package:habit_o_meter/screens/introduction/introduction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:habit_o_meter/screens/loading/loading.dart';
import 'package:habit_o_meter/screens/login/login.dart';

void main() {
  runApp(MatApp());
}

class MatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

//AppIntroductionScreen

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Future<FirebaseApp> _initialization =  Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return ErrorScreen();
        }

        if(snapshot.connectionState == ConnectionState.done){
          return AppIntroductionScreen();
        }

        return LoadingScreen();
      },

    );
  }
}
