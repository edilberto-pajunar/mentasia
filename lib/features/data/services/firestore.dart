import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentasia/features/data/models/message_data.dart';
import 'package:mentasia/features/data/services/storage.dart';
import 'package:uuid/uuid.dart';

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
      Uuid uuid = Uuid();
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

  Future<QuerySnapshot> getMessage() async {
    final snapshot = await _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("msg")
        .get();

    // final userMessage = snapshot.docs
    //     .map((e) => MessageData.fromJson(e as Map<String, dynamic>))
    //     .toList();
    return snapshot;
  }

  final List _message = [];
  List get message => _message;

  Future<List> fetchDocument() async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .collection("msg")
        .get();

    for (var doc in querySnapshot.docs) {
      _message.add(doc.data());
      print(_message);
    }
    return message;

    // for (var doc in querySnapshot.docs) {
    //   print(doc.data());
    // }
  }
}
