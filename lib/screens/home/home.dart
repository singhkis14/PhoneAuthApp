import 'package:flutter/material.dart';
import 'package:habit_o_meter/models/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthModel authModel = Provider.of<AuthModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Home Screen'),
            ),

            ElevatedButton(onPressed: ()=> authModel.logout(), child: Text('Logout'))

          ]
        ),
      ),
    );
  }
}
