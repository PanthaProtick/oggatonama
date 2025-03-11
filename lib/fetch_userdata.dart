import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oggatonama/user_class.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? getCurrentUserUID() {
  User? user = _firebaseAuth.currentUser;
  return user?.uid;
}

  Future<UserInformation> userInformation(String uid) async {
    try {
      DocumentSnapshot documentSnapshot = await _firestore.collection("users").doc(uid).get();

      if(documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        return UserInformation.fromFirestore(data);
      }
      else {
        throw Exception('Unavailable');
      }
    } on FirebaseException catch (e) {
      print("Error Fire: ${e.message}");
      throw Exception(e.hashCode);
    }
  }
}