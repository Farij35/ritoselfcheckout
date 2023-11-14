import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar appBarScan(context, String title, bool position) {
  return AppBar(
    leading: BackButton(
      onPressed: () {
        Navigator.pop(context);
        final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
        prefs.then((SharedPreferences prefs) {
          String? date = prefs.getString('date');
          String? time = prefs.getString('time');
          FirebaseFirestore.instance.collection('transaction-occuring').doc(date!).collection(time!).get().then((snapshot) {
            for (var doc in snapshot.docs) {
              doc.reference.delete();
            }
          });
        });
      }
    ),
    title: Text(
      title,
      style: const TextStyle(fontFamily: "BalooChettan2"),
    ),
    backgroundColor: const Color(0xFF002947),
    centerTitle: position,
  );
}

