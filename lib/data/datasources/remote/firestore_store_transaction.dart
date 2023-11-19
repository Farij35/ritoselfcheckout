import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_alertdialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../presentation/widgets/widget_item_card.dart';

String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
String time = DateFormat("HH:mm:ss").format(DateTime.now());

Future<void> storeTransaction(context, String barcode, Map<String, dynamic> data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('date', date);
  await prefs.setString('time', time);
  var docRef = FirebaseFirestore.instance
      .collection('transaction_occuring')
      .doc(barcode);
  var doc = await docRef.get();
  var itemDocRef = FirebaseFirestore.instance.collection('items_data').doc(barcode);
  var itemDoc = await itemDocRef.get();
  var itemStock = itemDoc.data()?['qty'];
  if (doc.exists) {
    if (itemStock < 1) {
      return alertDialog(context, "Peringatan", "Stok tidak cukup. Silahkan hubungi petugas");
    }
    docRef.update({'qty': FieldValue.increment(1)});
    itemDocRef.update({'qty' : FieldValue.increment(-1)});
    var hargaBarang = doc.data()?['harga_barang'];
    docRef.update({'harga_barang': hargaBarang * 2});
  } else {
    if (itemStock < 1) {
      return alertDialog(context, 'Peringatan', 'Stok tidak cukup. Silahkan hubungi petugas');
    }
    docRef.set({...data, 'qty': 1});
    itemDocRef.update({'qty' : FieldValue.increment(-1)});;
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
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var data = snapshot.data!.docs[index];
            return cardWidget(context, data["nama_barang"], data["harga_barang"].toString(), data["qty"].toString(), data["barcode"]);
          }
        );
      }
    );
  }
}



