import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../services/firestore.dart';

class ProfilePicture extends ChangeNotifier {
  late var _imageFile;
  File? _image;

  File? get image => _image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      _image = imagePermanent;

      final finalImage = await image.readAsBytes();

      _imageFile = FirestoreService().uploadProfilePic(finalImage);
    } on PlatformException catch (e) {
      print("Faild to pick image: $e");
    }
    notifyListeners();
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File("${directory.path}/$name");

    return File(imagePath).copy(image.path);
  }
}
