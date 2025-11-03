import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class GeneralController extends GetxController {
  ///============================= PICK SINGLE IMAGE ===============================

  Rx<File> imageFile = File("").obs;
  RxString imagePath = "".obs;

  Future<String> selectSingleImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    refresh();
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      imagePath.value = getImages.path;

      return imagePath.value;
    }

    return "";
  }
}


