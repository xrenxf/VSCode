import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome/appwrite/note/create_controller.dart';

class CreateAppWrite extends StatelessWidget {
  final controller = CreateAppWriteController();
  
  CreateAppWrite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create App Write'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "Title"
                    ),
                    keyboardType: TextInputType.text,
                    controller: controller.judulEditingController,
                    validator: (value){
                      return controller.validateTitle(value!);
                    },
                  ),
      
                  const SizedBox(height: 10,),
      
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "Noted"
                    ),
                    keyboardType: TextInputType.text,
                    controller: controller.noteEditingController,
                    validator: (value){
                      return controller.validateTitle(value!);
                    },
                  ),
      
                  const SizedBox(height: 10,),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => controller.imagePath.value == ''
                        ? const Text(
                          'Select image from gallery',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        )
                        : CircleAvatar(
                            radius: 80,
                            backgroundImage: 
                              FileImage(File(controller.imagePath.value)
                              )
                        )
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        onPressed: (){
                          controller.selectImage();
                        },
                      )
                    ],
                  ),
      
                  const SizedBox(height: 10,),
      
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(14))
                      ),
                      child: const Text(
                        "Create Noted",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: (){
                        controller.validateAndSave(
                          judul: controller.judulEditingController.text,
                          note: controller.noteEditingController.text,
                        );
                      },
                    ),
                  )
                ]
              ),
            ),
          ),
        ),
      )
    );
  }
}