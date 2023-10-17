import 'package:aplikasi/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi/login/login_page.dart';
import 'package:aplikasi/login/signup_profile.dart';
import 'package:aplikasi/login/text_field.dart';
import 'package:aplikasi/login/text_decorator.dart';
import 'package:aplikasi/welcome/custom_button.dart';
import 'package:aplikasi/controller/signup_controller.dart';


class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  SignUpController signUpController = Get.put(SignUpController());

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _globalKey,
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
                    userIdHintTextColor: Colors.indigoAccent,
                    useridTextFieldPrefixIcon: Icons.person,
                    useridTextFieldPrefixIconColor: Colors.indigoAccent,
                    onUseridValueChange: (value) {},
                  ),
                ),
                TextDecorator(
                  child: UserIdTextField(
                    useridController: emailController,
                    userIdErrorText: "Email Id can not be empty",
                    userIdHintText: "Enter Email Id",
                    userIdHintTextColor: Colors.indigoAccent,
                    useridTextFieldPrefixIcon: Icons.email,
                    useridTextFieldPrefixIconColor: Colors.indigoAccent,
                    onUseridValueChange: (value) {},
                  ),
                ),
                TextDecorator(
                  child: UserIdTextField(
                    useridController: passController,
                    userIdErrorText: "Password not be empty",
                    userIdHintText: "Enter Password",
                    userIdHintTextColor: Colors.indigoAccent,
                    useridTextFieldPrefixIcon: Icons.lock,
                    useridTextFieldPrefixIconColor: Colors.indigoAccent,
                    onUseridValueChange: (value) {},
                  ),
                ),
                TextDecorator(
                  child: UserIdTextField(
                    useridController: confirmPassController,
                    userIdErrorText: "Password not be empty",
                    userIdHintText: "Re-Enter Password",
                    userIdHintTextColor: Colors.indigoAccent,
                    useridTextFieldPrefixIcon: Icons.lock,
                    useridTextFieldPrefixIconColor: Colors.indigoAccent,
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
                  handleButtonClick: () {
                    signup();

                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                  },
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
      ),
    );
  }
  
  void signup() {
    final _isValid = _globalKey.currentState!.validate();
    if (_isValid) {
      print(nameController.text);
      print(emailController.text);
      print(passController.text);
      print(confirmPassController.text);

      signUpController.signUpUser(
          nameController.text,
          emailController.text,
          passController.text,
          confirmPassController.text);
    } else {
      return null;
    }
  }
}