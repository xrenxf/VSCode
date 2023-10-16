import 'package:flutter/material.dart';
import 'package:aplikasi/login/login_page.dart';
import 'package:aplikasi/login/signup_profile.dart';
import 'package:aplikasi/login/user_field.dart';
import 'package:aplikasi/login/text_decorator.dart';
import 'package:aplikasi/welcome_page/custom_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SignUpProfile(),
              const SizedBox(
                height: 20,
              ),
              TextDecorator(
                child: UserIdTextField(
                  useridController: nameController,
                  userIdErrorText: "Name can not be empty",
                  userIdHintText: "Enter Name",
                  userIdHintTextColor: Colors.purple,
                  useridTextFieldPrefixIcon: Icons.person,
                  useridTextFieldPrefixIconColor: Colors.purple,
                  onUseridValueChange: (value) {},
                ),
              ),
              TextDecorator(
                child: UserIdTextField(
                  useridController: emailController,
                  userIdErrorText: "Email Id can not be empty",
                  userIdHintText: "Enter Email Id",
                  userIdHintTextColor: Colors.purple,
                  useridTextFieldPrefixIcon: Icons.person,
                  useridTextFieldPrefixIconColor: Colors.purple,
                  onUseridValueChange: (value) {},
                ),
              ),
              TextDecorator(
                child: UserIdTextField(
                  useridController: mobileController,
                  userIdErrorText: "Mobile no not be empty",
                  userIdHintText: "Enter Mobile",
                  userIdHintTextColor: Colors.purple,
                  useridTextFieldPrefixIcon: Icons.person,
                  useridTextFieldPrefixIconColor: Colors.purple,
                  onUseridValueChange: (value) {},
                ),
              ),
              TextDecorator(
                child: UserIdTextField(
                  useridController: passController,
                  userIdErrorText: "Password not be empty",
                  userIdHintText: "Enter Password",
                  userIdHintTextColor: Colors.purple,
                  useridTextFieldPrefixIcon: Icons.person,
                  useridTextFieldPrefixIconColor: Colors.purple,
                  onUseridValueChange: (value) {},
                ),
              ),
              TextDecorator(
                child: UserIdTextField(
                  useridController: confirmPassController,
                  userIdErrorText: "Password not be empty",
                  userIdHintText: "Re-Enter Password",
                  userIdHintTextColor: Colors.purple,
                  useridTextFieldPrefixIcon: Icons.person,
                  useridTextFieldPrefixIconColor: Colors.purple,
                  onUseridValueChange: (value) {},
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                  buttonColor: Colors.indigoAccent,
                  buttontext: "Sign Up",
                  textColor: Colors.white,
                  handleButtonClick: () {}
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have account ?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: const Text(
                      "Login Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.purple),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}