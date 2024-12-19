import 'package:flutter/material.dart';
import 'package:smarthome/features/home/presentation/screens/home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Login Page'),),
        backgroundColor: Colors.grey[600],
        body: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // app name
                const Text(
                  "SMART HOME",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
          
                const SizedBox(height: 50),
          
                // email textfield
                TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  obscureText: false,
                  controller: emailController,
                ),

                const SizedBox(height: 10),
          
                // password textfield
                TextField(
                 decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: passwordController,
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
          
                //sign in button
                ElevatedButton(
                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;

                    // Contoh sederhana untuk memeriksa email dan password
                    if (email == 'user@example.com' && password == 'password') {
                      // Jika autentikasi berhasil, pindah ke halaman berikutnya
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    } else {
                      // Jika autentikasi gagal, tampilkan pesan kesalahan
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Email or password is incorrect.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
          
                // don't have an account? Register here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => RegisterPage()),
                      //   );
                      // },
                      child: const Text(
                        'Don\'t have an account? Register here',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ),
      );
    }
}