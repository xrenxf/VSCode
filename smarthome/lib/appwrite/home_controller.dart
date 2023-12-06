import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smarthome/appwrite/auth/auth.dart';
import 'note/note_model.dart';

class HomeController extends GetxController with StateMixin<List<Note>>{
  AuthRepository authRepository;
  HomeController(this.authRepository);

  final GetStorage getStorage = GetStorage();
  late List<Note> noteList = [];

  @override
  void onInit(){
    super.onInit();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();
  }

  gatNote() async{
    try{
      change(null, status: RxStatus.loading());
      await authRepository.getNoted().then((value){
        Map<String, dynamic> data = value.toMap();
        List d = data['documents'].toList();
        noteList =d
          .map(
            (e) => Note.fromMap(e['data']),
          )
          .toList();
        change(noteList, status: RxStatus.success());
      }).catchError((error){
        if(error is AppwriteException){
          change(null, status: RxStatus.error(error.response['message']));
        } else {
          change(null, status: RxStatus.error("Something went wrong"));
        }
      });
    }catch(e){
      change(null, status: RxStatus.error("Something went wrong"));
    }
  }
}