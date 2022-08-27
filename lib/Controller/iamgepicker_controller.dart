

import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class picImageController extends GetxController {


  File? posterImage;
  XFile? xfile;

  // var stateimage;
  // void getDisplayimage(image) {
  //   stateimage = image;
  // }


   Future pickImage() async {
    final ImagePicker _picker = ImagePicker();

    xfile = await _picker.pickImage(source: ImageSource.gallery);

    if (xfile == null) {
      return;
    }

    posterImage = File(xfile!.path);

    update();
  }
}
