import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/data/datasources/remote/firestore_search_data.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_textfield_scan.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_sizedbox.dart';

class AdminAddItem extends StatefulWidget {
  const AdminAddItem({super.key});

  @override
  State<AdminAddItem> createState() => _AdminAddItemState();
}

class _AdminAddItemState extends State<AdminAddItem> {
  var searchItem = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Scan atau Masukkan Barcode", true),
      backgroundColor: const Color(0xFF9DBBD0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildTextFieldScan(onChanged: (value) {
              setState(() {
                searchItem = value;
              });
            }),
            buildSizedBox(20, 0),
            SearchData(searchItem: searchItem)
          ],
        ),
      ),
    );
  }
}
