import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/data/datasources/remote/firestore_data_source.dart';
import 'package:ritoselfcheckout/presentation/widgets/big_item_card_widget.dart';

Widget itemsDataWidget() {
  return FutureBuilder(
    future: getItemsData(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data?.data() as Map<String, dynamic>;
        return bigCardWidget(context, data['nama_barang'], data['harga_barang'].toString(), data['qty'].toString(), data['barcode'], 2);
      } else if (snapshot.connectionState == ConnectionState.none) {
        return const Text("Barang Tidak Ada");
      }
      return Container();
    },
  );
}