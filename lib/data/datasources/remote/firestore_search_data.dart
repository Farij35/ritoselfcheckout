import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/big_item_card_widget.dart';

class SearchData extends StatelessWidget {
  final String searchItem;
  const SearchData({super.key, required this.searchItem});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('items_data').orderBy('barcode').startAt([searchItem]).endAt(["$searchItem\uf8ff"]).snapshots(),
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
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              return bigCardWidget(context, data['nama_barang'], data['harga_barang'].toString(), data['qty'].toString(), data['barcode'], 2);
            }
          ),
        );
      }
    );
  }
}




