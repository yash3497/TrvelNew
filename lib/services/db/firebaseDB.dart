import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseDB {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference user = FirebaseFirestore.instance.collection('users');

  Future<void> addBookmark(String id, String title, String subtitle,
      String image, String location) async {
    try {
      var uid = await _auth.currentUser!.uid;
      var data = user.doc(uid).collection('bookmarks').add({
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "image": image,
        "location": location
      });
      Fluttertoast.showToast(msg: "Saved to Bookmarks");
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
