import 'package:flutter/material.dart';
import 'package:habit_o_meter/models/auth.dart';
import 'package:provider/provider.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {

  late AuthModel _authModel;
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  initState(){
    super.initState();
    _authModel = Provider.of<AuthModel>(context, listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Mobile Number'),
      ),
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    decoration: new InputDecoration(
                      labelText: "Enter your number",
                      hintText: "+91-0000000000",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      _authModel.verifyPhoneNumber(_phoneNumberController.text);
                    },
                    child: Text('Send OTP'))
              ]
          ),
        ),
      ),
    );
  }
}



/*
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  final SmsAutoFill _autiFill = SmsAutoFill();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthModel authModel = Provider.of<AuthModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _phoneNumberController,
              decoration: new InputDecoration(
                labelText: "Enter your number",
                hintText: "+91-0000000000",
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  _phoneNumberController.text  = await this._autiFill.hint ?? "+91-9900484090";
                },
                child: Text("Get current number"),
              ),
            ),


            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Text("Verify Number"),
                onPressed: () async {
                  authModel.verifyPhoneNumber(_phoneNumberController.text);
                },
              ),
            ),
          ],
        ),

      ),

    );
  }
}


 */
