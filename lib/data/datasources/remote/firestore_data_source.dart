import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
  var firebaseAuth = FirebaseAuth.instance.currentUser;
  return await FirebaseFirestore.instance.collection('user_credential').doc(firebaseAuth?.uid).get();
}