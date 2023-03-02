import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/my_user.dart';
import '../models/room.dart';

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

  static CollectionReference<Room> getRoomsCollection() {
    return FirebaseFirestore.instance
        .collection(Room.COLLECTION_NAME)
        .withConverter<Room>(
          fromFirestore: (snapshot, options) => Room.fromJson(snapshot.data()!),
          toFirestore: (room, options) => room.toJson(),
        );
  }

  static Future<void> addRoomToFireStore(Room room) {
    var collection = getRoomsCollection();
    var docRef = collection.doc();
    room.id = docRef.id;
    return docRef.set(room);
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
