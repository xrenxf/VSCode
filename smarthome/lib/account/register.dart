// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             padding: const EdgeInsets.all(25.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // app name
//                 const Text(
//                   "SMART HOME",
//                   style: TextStyle(
//                     fontSize: 20,
//                      color: Colors.black,
//                   ),
//                 ),
          
//                 const SizedBox(height: 50),
          
//                 // username textfield
//                 MyTextField(
//                   hintText: "Username",
//                   obscureText: false,
//                   controller: usernameController,
//                 ),

//                 const SizedBox(height: 10),

//                 // email textfield
//                 MyTextField(
//                   hintText: "Email",
//                   obscureText: false,
//                   controller: emailController,
//                 ),

//                 const SizedBox(height: 10),
          
//                 // password textfield
//                 MyTextField(
//                   hintText: "Password",
//                   obscureText: true,
//                   controller: passwordController,
//                 ),

//                 const SizedBox(height: 10),

//                 // confirm password textfield
//                 MyTextField(
//                   hintText: "Confirm Password",
//                   obscureText: true,
//                   controller: confirmController,
//                 ),

//                 const SizedBox(height: 10),
          
//                 // forgot password
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       "Forgot Password?",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.secondary,
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 25),
          
//                 // register button
//                 MyButton(
//                   text: "Register",
//                   onTap: registerUser,
//                 ),
          
//                 // already have an account? Register here
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Already have an account? ",
//                       style: TextStyle(
//                          color: Colors.black,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: widget.onTap,
//                       child: 
//                         Text(
//                           "Login Here",
//                           style: TextStyle(
//                             color: Theme.of(context).colorScheme.secondary,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ),
//       ),
//     );
//   }