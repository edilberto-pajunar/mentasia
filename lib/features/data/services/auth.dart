import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mentasia/features/data/models/user.dart' as model;

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signInAnonymously() async {
    UserCredential cred = await _auth.signInAnonymously();

    model.User user = model.User(
      name: "guest${cred.user!.uid}",
    );

    await _firestore.collection("users").doc(cred.user!.uid).set(
          user.toJson(),
        );
  }

  Future createAccount(String email, String password, context) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      model.User user = model.User(
        email: email,
        password: password,
        name: email.substring(
          0,
          email.indexOf("@"),
        ),
      );

      await _firestore.collection("users").doc(cred.user!.uid).set(user.toJson());
    } on FirebaseAuthException {
      if (kDebugMode) {
        print("Error");
      }
    }
  }

  Future loginUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future logout() async {
    await _auth.signOut();
  }
}
