import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

AppBar appBarScan(context, String title, bool position) {
  return AppBar(
    leading: BackButton(
      onPressed: () {
        Navigator.pop(context);
        FirebaseFirestore.instance.collection('transaction-occuring').get().then((snapshot) {
          for (var doc in snapshot.docs) {
            doc.reference.delete();
          }
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

