import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/my_user.dart';

class DataBaseUtils {
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.COLLECTION_NAME)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              MyUser.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore(String id) async {
    DocumentSnapshot<MyUser> user = await getUsersCollection().doc(id).get();

    var myUser = user.data();
    return myUser;
  }
}
