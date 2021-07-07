import 'package:flutter/material.dart';
import 'package:habit_o_meter/models/auth.dart';
import 'package:provider/provider.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {

  late AuthModel _authModel;
  TextEditingController _otpController = TextEditingController();

  @override
  initState(){
    super.initState();
    _authModel = Provider.of<AuthModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
      ),
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: TextFormField(
                    controller: _otpController,
                    decoration: new InputDecoration(
                      labelText: "Enter OTP here",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await _authModel.registerUserWithOTP(_otpController.text);
                      Navigator.pop(context);
                    },
                    child: Text('Register'))
              ]
          ),
        ),
      ),
    );
  }
}

