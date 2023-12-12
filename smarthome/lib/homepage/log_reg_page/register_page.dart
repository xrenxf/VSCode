import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/homepage/log_reg_page/button.dart';
import 'package:smarthome/homepage/log_reg_page/textfield.dart';
import '../help/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  // Register method
  void registerUser() async {
    // show loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );

    // make sure passwords match
    if(passwordController.text != confirmController.text){
      // pop loading circle
      Navigator.pop(context);

      // show error message to user
      displayMessageTouser("Passwords don't match!", context);
    }

    // if passwords do match
    else {
        // try creating the user
      try {
        // create the user
        UserCredential? userCredential = 
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text,
        );

        // create a user document and add to firestore
        createUserDocument(userCredential);

        // pop loading circle
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e){
        // pop loading circle
        Navigator.pop(context);

        // display error message to user
        displayMessageTouser(e.code, context);
      }
    }
  }

  // create a user document and collect them in firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null){
      await FirebaseFirestore.instance
        .collection("Users")
        .doc(userCredential.user!.email)
        .set({
          'email': userCredential.user!.email,
          'username': usernameController.text,
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // app name
                const Text(
                  "SMART HOME",
                  style: TextStyle(
                    fontSize: 20,
                     color: Colors.black,
                  ),
                ),
          
                const SizedBox(height: 50),
          
                // username textfield
                MyTextField(
                  hintText: "Username",
                  obscureText: false,
                  controller: usernameController,
                ),

                const SizedBox(height: 10),

                // email textfield
                MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController,
                ),

                const SizedBox(height: 10),
          
                // password textfield
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),

                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmController,
                ),

                const SizedBox(height: 10),
          
                // forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
          
                // register button
                MyButton(
                  text: "Register",
                  onTap: registerUser,
                ),
          
                // already have an account? Register here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                         color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: 
                        Text(
                          "Login Here",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}