import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentasia/features/data/services/storage.dart';

class FirestoreService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadProfilePic(file) async {
    String res = "Error";

    try {
      final image =
          await StorageService().uploadImageToStorage("profilePics", file);
      await _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .update({"profilePic": image});
      res = "Success";
    } catch (e) {
      print("Error: $e");
    }
    return res;
  }

  Future<String> getProfilePic() async {
    String res = "Error";
    try {
      final image = await _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .get();
    } catch (e) {
      print("Error: $e");
    }

    return res;
  }
}
