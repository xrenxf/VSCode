import 'package:appwrite/appwrite.dart';
import 'package:smarthome/appwrite/conn/conn.dart';
import 'package:appwrite/models.dart' as models;

class AppWriteConn{
  Client client = Client();

  Account? account;

  Storage? storage;
  Databases? databases;

  AppWriteConn(){
    client
      .setEndpoint(AppWrite.endPoint)
      .setProject(AppWrite.projectId)
      .setSelfSigned(status: true);
    account = Account(client);
    storage = Storage(client);
    databases = Databases(client);
  }
  
  Future<models.File> uploadNoteImage(String imagePath){
    String fileName = "${DateTime.now().millisecondsSinceEpoch}"
      "${imagePath.split(".").last}";
    
    final response = storage!.createFile(
      bucketId: AppWrite.noteBucketId, 
      fileId: ID.unique(), 
      file: InputFile.fromPath(path: imagePath, filename: fileName)
    );

    return response;
  }

  Future<dynamic> deleteNoteImage(String fileId){
    final response = storage!.deleteFile(
      bucketId: AppWrite.noteBucketId, 
      fileId: fileId,
    );

    return response;
  }

  Future<models.Document> createNote(Map map) async {
    final response = databases!.createDocument(
      databaseId: AppWrite.dbId,
      collectionId: AppWrite.noteCollectionId,
      documentId: ID.unique(),
      data: {
        "judul":map["judul"],
        "note":map["note"],
        "createdBy":map["createdBy"],
        "image":map["image"],
        "createAt":map["createAt"]
      }
    );

    return response;
  }

  Future<models.DocumentList> getNoted() async {
    final response = databases!.listDocuments(
      databaseId: AppWrite.dbId,
      collectionId: AppWrite.noteCollectionId,
    );
    return response;
  }
}