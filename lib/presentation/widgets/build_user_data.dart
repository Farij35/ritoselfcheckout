import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/text_widget.dart';
import '../../data/datasources/remote/firestore_data_source.dart';

Widget buildUserData() {
  return FutureBuilder(
    future: getUserData(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data?.data() as Map<String, dynamic>;
        return buildText(data["nama"], 24, Colors.white);
      } else if (snapshot.connectionState == ConnectionState.none) {
        return const Text("No data");
      }
      return Container(); // Return an empty container when data is loading
    },
  );
}

Widget buildLoadingIndicator() {
  return FutureBuilder(
    future: getUserData(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container( // This container covers the whole drawer
          color: Colors.black.withOpacity(0.5), // This gives a semi-transparent effect
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Container(); // If data is loaded or there is an error, don't cover the drawer
      }
    },
  );
}