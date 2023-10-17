import 'package:flutter/material.dart';
import 'package:aplikasi/login/login_page.dart';
import 'package:aplikasi/login/signup_page.dart';
import 'package:aplikasi/welcome/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(          
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              Center(
                child: Image.asset('assets/banner.png',
                width: size.width * 0.8,
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonColor: Colors.indigoAccent,
                buttontext: "LOGIN",
                textColor: Colors.white,
                handleButtonClick: (){
                  loginButtonClickHandler(context);
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonColor: Colors.indigoAccent,
                buttontext: "SIGNUP",
                textColor: Colors.black,
                handleButtonClick: (){
                  signUpButtonClickHandler(context);
                },
              ),
            ],
          ),
        ),
      )
    );
  }

  loginButtonClickHandler(BuildContext context) {
    print("Login Clicked");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => LoginPage(),
      ),
    );
  }

  signUpButtonClickHandler(BuildContext context) {
    print("Signup Clicked");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => SignUpPage(),
      ),
    );
  }
}
