import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:intl/intl.dart';

String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
String time = DateFormat("HH:mm:ss").format(DateTime.now());

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
  var firebaseAuth = FirebaseAuth.instance.currentUser;
  return await FirebaseFirestore.instance.collection('user_credential').doc(firebaseAuth?.uid).get();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getItemsData() async {
  return await FirebaseFirestore.instance.collection('items_data').doc(BarcodeController.barcodeController.text).get();
}

Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getTransactionItemsData() async {
  return FirebaseFirestore.instance.collection('transaction').doc(date).collection(time).snapshots();
}