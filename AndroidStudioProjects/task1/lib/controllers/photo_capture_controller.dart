import 'dart:html';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PhotoCaptureController extends GetxController {
  Future<void> captureAndUploadPhoto() async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      // Upload photo to Firebase Storage
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = FirebaseStorage.instance.ref().child('photos/$fileName.jpg');
      await ref.putFile(File(imageFile.path));
    }
  }
}
