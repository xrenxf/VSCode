import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/homepage/help/helper_functions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("users"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[700],
      body: Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            // any errors
            if (snapshot.hasError){
              displayMessageTouser("Something went wrong", context);
            }
      
            // show loading circle
            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
      
            if (snapshot.data == null){
              return const Text("No Data");
            }
      
            // get all users
            final users = snapshot.data!.docs;
      
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder:(context, index) {
                      // get individual user
                      final user = users[index];
      
                      return ListTile(
                        title: Text(
                          user['username'],
                          style: const TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          user['email'],
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}