import 'package:flutter/material.dart';
import 'package:habit_o_meter/models/auth.dart';
import 'package:habit_o_meter/screens/error/error.dart';
import 'package:habit_o_meter/screens/login/widgets/phone.dart';
import 'package:habit_o_meter/screens/login/widgets/otp.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AuthModel authModel = Provider.of<AuthModel>(context, listen: false);

    return Selector<AuthModel, LoginView>(
      selector: (context, authModel) => authModel.currentLoginState,
      builder: (context, loginState, _){
        if(LoginView.Phone == loginState){
          return PhoneNumberPage();
        }
        else if(LoginView.OTP == loginState){
          return OTPPage();
        }
        else if(LoginView.User == loginState){
          return Container();
        }else{
          return ErrorScreen();
        }
      },
    );
  }
}
