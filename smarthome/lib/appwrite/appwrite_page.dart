import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
// import 'package:image_picker/image_picker.dart';

class AppWritePage extends StatefulWidget {
  const AppWritePage({super.key});

  @override
  State<AppWritePage> createState() => _AppWritePageState();
}

class _AppWritePageState extends State<AppWritePage> {
  late final Client client;
  late final Databases database;
  late final Storage storage;

  late TextEditingController titleController;
  late TextEditingController notesController;

  File? _image;

  @override
  void initState() {
    super.initState();

    // Inisialisasi Appwrite Client
    client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Ganti dengan endpoint Appwrite Anda
        .setProject('6566017e79c56edd96bd'); // Ganti dengan ID proyek Appwrite Anda

    // Inisialisasi Database dan Storage dari Appwrite Client
    database = Databases(client);
    storage = Storage(client);

    // Inisialisasi Controller untuk TextField
    titleController = TextEditingController();
    notesController = TextEditingController();
  }

  // Future<void> _uploadImage() async {
  //   final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });

  //     // Upload gambar ke Appwrite Storage
  //     final response = await storage.createFile(
  //       read: ['*'],
  //       write: ['*'],
  //       file: await MultipartFile.fromFile(_image!.path),
  //       bucketId: '656f374abab55f31025d',
  //     );

  //     if (response.statusCode == 201) {
  //       // URL gambar yang diunggah
  //       final imageUrl = response.data!['\$id'];
  //       print('Image uploaded: $imageUrl');
  //     } else {
  //       print('Failed to upload image. Status code: ${response.statusCode}');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Judul',
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: notesController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Catatan',
              ),
            ),

            const SizedBox(height: 16),

            _image != null
                ? Image.file(_image!)
                : Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    child: const Icon(Icons.image),
                  ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: (){}, //_uploadImage,
              child: const Text('Pilih Gambar'),
            ),
            
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                // final title = titleController.text;
                // final notes = notesController.text;
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      )
    );
  }
}
