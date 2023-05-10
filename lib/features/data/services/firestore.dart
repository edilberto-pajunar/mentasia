import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentasia/features/data/models/message_data.dart';
import 'package:mentasia/features/data/services/storage.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<void> sendMessage(String message, bool isUserMessage) async {
    try {
      MessageData messageData =
          MessageData(message: message, isUserMessage: isUserMessage);
      await _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .collection("msg")
          .doc(
            DateTime.now().toIso8601String(),
          )
          .set(
            messageData.toJson(),
          );
    } catch (e) {
      print("Error: $e");
    }
  }

  Stream<QuerySnapshot> readMessage() {
    final documentSnapshot = _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("msg")
        .snapshots();

    return documentSnapshot;
  }

  Future updateName(String name) async {
    await _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .set(
            {
          "name": name,
        },
            SetOptions(
              merge: true,
            ));
  }

  Future<dynamic> getProfile() async {
    final snapshot = _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get();
  }
}
