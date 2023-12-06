import 'package:flutter/material.dart';
import 'package:smarthome/appwrite/create_appwrite.dart';

class AppWritePage extends StatelessWidget {
  const AppWritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "App Write",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "Add App Write",
            style: TextStyle(color: Colors.grey[800]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateAppWrite())
          );
        },
      ),
    );
  }
}