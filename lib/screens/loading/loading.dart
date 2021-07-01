import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Icon(Icons.rotate_left, size: 200,)
      ),
    );
  }
}
