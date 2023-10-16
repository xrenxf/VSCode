import 'package:flutter/material.dart';
import 'package:aplikasi/login/password.dart';
import 'package:aplikasi/login/user_field.dart';
import 'package:aplikasi/login/text_decorator.dart';
import 'package:aplikasi/welcome_page/custom_button.dart';
import 'package:aplikasi/login/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController useridController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String userIdErrorText = "User Id can't be empty";
  String userIdHintText = "Enter User Id";
  Color userIdHintTextColor = Colors.indigoAccent;
  IconData useridTextFieldPrefixIcon = Icons.person;
  Color useridTextFieldPrefixIconColor = Colors.indigoAccent;

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
              const SizedBox(height: 200),
              const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextDecorator(
                      child: UserIdTextField(
                        useridController: useridController,
                        userIdErrorText: userIdErrorText,
                        userIdHintText: userIdHintText,
                        userIdHintTextColor: userIdHintTextColor,
                        useridTextFieldPrefixIcon: useridTextFieldPrefixIcon,
                        useridTextFieldPrefixIconColor:
                        useridTextFieldPrefixIconColor,
                        onUseridValueChange: (value) {
                          //print(value);
                        },
                      ),
                    ),
                    TextDecorator(
                      child: UserPassTextField(
                        userPassController: passController,
                        userPassErrorText: "PasswordcCan not be empty",
                        userPassHintText: "Enter Password",
                        userPassHintTextColor: Colors.indigoAccent,
                        userPassTextFieldPrefixIcon: Icons.lock,
                        userPassTextFieldPrefixIconColor: Colors.indigoAccent,
                        suffixIcon: Icons.visibility_off,
                        suffixIconColor: Colors.indigoAccent,
                        onUserPassValueChange: (value) {
                          print("pass value $value");
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        buttonColor: Colors.indigoAccent,
                        buttontext: "LOGIN",
                        textColor: Colors.white,
                        handleButtonClick: () {
                        print("Login");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dont have account?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigoAccent,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                        ),
                      ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}