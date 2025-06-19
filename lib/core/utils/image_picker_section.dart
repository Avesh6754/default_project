import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProfileImage {

  ImagePicker imagePicker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final XFile? file = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if(file==null){
      return null;
    }
    else {
      return File(file.path);
    }
  }

  Future<File?> pickImageFromCamera() async {
    final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
   if(file==null){
     return null;
   }
   else {
     return File(file.path);
   }
  }
}
