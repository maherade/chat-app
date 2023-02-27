import 'package:chat/base.dart';
import 'package:chat/dataBaseUtils/database_utils.dart';
import 'package:chat/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  var auth = FirebaseAuth.instance;
  String message = "";

  void loginWithFirebaseAuth(String email, String password) async {
    try {
      navigator!.showLoading();
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      message = "Successfully Login";
      MyUser? myUser =
          await DataBaseUtils.readUserFromFireStore(credential.user?.uid ?? "");
      if (myUser != null) {
        navigator!.hideDialog();
        navigator!.goToHome(myUser);
        return;
      }
    } on FirebaseAuthException catch (e) {
      message = "Invalid email or password";
    } catch (e) {
      message = "Something went wrong $e";
    }
    if (message != "") {
      navigator!.hideDialog();
      navigator!.showMessage(message);
    }
  }
}
