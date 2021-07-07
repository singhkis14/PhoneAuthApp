import 'package:flutter/material.dart';
import 'package:habit_o_meter/common/AppState.dart';
import 'package:habit_o_meter/models/auth.dart';
import 'package:habit_o_meter/screens/error/error.dart';
import 'package:habit_o_meter/screens/home/home.dart';
import 'package:habit_o_meter/screens/introduction/introduction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_o_meter/screens/loading/loading.dart';
import 'package:habit_o_meter/screens/login/login.dart';
import 'package:habit_o_meter/screens/login/widgets/otp.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppRoot());
}

class AppRoot extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthModel()),
      ],
      child: MatApp(),
    );
  }
}

// Material App
class MatApp extends StatelessWidget {
  const MatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Selector<AuthModel, AppState>(
        selector: (BuildContext conext, AuthModel authModel) => authModel.currentAppState,
        builder: (context, AppState currentAppState, _) {
          if (currentAppState == AppState.LoggedOut) {
            return AppIntroductionScreen();
          } else if (currentAppState == AppState.LoggedIn) {
            return HomeScreen();
          } else {
            return ErrorScreen();
          }
        },
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen()
      },
    );
  }
}
