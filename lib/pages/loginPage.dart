import 'package:signalr_client/pages/chatPage.dart';
import 'package:signalr_client/utils/appTheme.dart';
import 'package:signalr_client/widgets/loginButtonWidget.dart';
import 'package:signalr_client/widgets/loginHeaderWidge.dart';
import 'package:signalr_client/widgets/loginVersionWidget.dart';
import 'package:signalr_client/widgets/loginMainImageWidget.dart';
import 'package:signalr_client/widgets/loginSubtitleWidget.dart';
import 'package:signalr_client/widgets/loginTextInputWidget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameTextController = TextEditingController();

  onTapButton() {
    if (usernameTextController.text.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          'Please enter your name',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.redAccent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => ChatPage(usernameTextController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: AppTheme.loginContainerBoxdecoration,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                loginHeaderWidget(),
                loginSubtitleWidget(),
                loginMainImageWidget(size),
                loginTextInputWidget(size, usernameTextController),
                loginButtonWidget(size, onTapButton),
                loginVersionWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
