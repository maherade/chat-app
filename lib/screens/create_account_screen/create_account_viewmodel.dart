import 'package:chat/base.dart';
import 'package:chat/screens/create_account_screen/create_account_navigator.dart';
import 'package:chat/shared/components/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator> {
  String message = "";

  void createAccountWithFirebaseAuth(String email, String password) async {
    try {
      navigator!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      message = 'Account Created';
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
        message = "The password provided is too weak.";
      } else if (e.code == FirebaseErrors.emailInUse) {
        message = "This account already exists for that email.";
      }
    } catch (e) {
      message = "Something went wrong $e";
    }
    if (message != "") {
      navigator!.hideLoading();
      navigator!.showMessage(message);
    }
  }
}
