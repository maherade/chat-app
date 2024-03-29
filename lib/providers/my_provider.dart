import 'package:chat/dataBaseUtils/database_utils.dart';
import 'package:chat/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  MyUser? myUser;
  User? firebaseUser;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initMyUser();
    }
  }

  void initMyUser() async {
    myUser = await DataBaseUtils.readUserFromFireStore(firebaseUser?.uid ?? "");
  }
}
