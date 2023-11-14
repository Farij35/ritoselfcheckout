import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../presentation/widgets/item_card_widget.dart';

String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
String time = DateFormat("HH:mm:ss").format(DateTime.now());

Future<void> storeTransaction(String barcode, Map<String, dynamic> data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('date', date);
  await prefs.setString('time', time);
  var docRef = FirebaseFirestore.instance
      .collection('transaction_occuring')
      .doc(barcode);
  var doc = await docRef.get();
  if (doc.exists) {
    docRef.update({'qty': FieldValue.increment(1)});
    var hargaBarang = doc.data()?['harga_barang'];
    docRef.update({'harga_barang': hargaBarang * 2});
  } else {
    docRef.set({...data, 'qty': 1});
  }
}

class GetTransactionItems extends StatelessWidget {
  const GetTransactionItems({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('transaction_occuring').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index];
                return cardWidget(context, data["nama_barang"], data["harga_barang"].toString(), data["qty"].toString(), data["barcode"]);
              }
          ),
        );
      }
    );
  }
}



