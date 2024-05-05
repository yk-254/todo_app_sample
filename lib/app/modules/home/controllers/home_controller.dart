import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/app/modules/home/views/listShow.dart';
import 'package:todo_app/app/modules/home/views/profile.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var index = 0.obs;
  final box = GetStorage();
  var pages = [ListShowView(), ProfileView()].obs;
  TextEditingController ctrl = TextEditingController();
  var todo = [].obs;
  var imagepath = ''.obs;
  void getImage(ImageSource imageSource) async {
    final file = await ImagePicker().pickImage(source: imageSource);
    if (file != null) {
      imagepath.value = file.path;
      box.write('image', imagepath.value);
    } else {
      Get.snackbar('خطا', 'هیچ عکسی انتخاب نشده',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    update();
  }

  void addList() {
    todo.value.add({"txt": ctrl.text, "checkbox": false});
    box.write('todo', todo.value);
    ctrl.clear();
    update();
  }

  @override
  void onInit() {
    if (box.read('todo') != null) {
      todo.value = box.read('todo');
    }
    if(box.read('image') != null){
      imagepath.value=box.read('image');
    }
    super.onInit();
  }
}
