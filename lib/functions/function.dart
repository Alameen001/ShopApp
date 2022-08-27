import 'package:image_picker/image_picker.dart';

Future<String> imageSelect() async {
  XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
  return img!.path;
}

Future<String> camaraSelect() async {
  XFile? img = await ImagePicker().pickImage(source: ImageSource.camera);
  return img!.path;
}
