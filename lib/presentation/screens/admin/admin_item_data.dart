import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/data/datasources/remote/firestore_search_data.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_textfield_search.dart';

class AdminItemData extends StatefulWidget {
  const AdminItemData({super.key});

  @override
  State<AdminItemData> createState() => _AdminItemDataState();
}

class _AdminItemDataState extends State<AdminItemData> {
  var searchData = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Data Barang", true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextfieldSearch(onChanged: (value) {
              setState(() {
                searchData = value;
              });
            },
              labelText: "Cari berdasarkan kode barcode"
            ),
          ),
          Expanded(
            child: SearchData(searchItem: searchData),
          ),
        ],
      ),
    );
  }
}
