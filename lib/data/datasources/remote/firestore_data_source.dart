import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
  var firebaseAuth = FirebaseAuth.instance.currentUser;
  return await FirebaseFirestore.instance.collection('user_credential').doc(firebaseAuth?.uid).get();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getItemsData() async {
  return await FirebaseFirestore.instance.collection('items_data').doc(BarcodeController.barcodeController.text).get();
}