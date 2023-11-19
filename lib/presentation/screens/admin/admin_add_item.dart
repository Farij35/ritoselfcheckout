import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_textfield_scan.dart';

class AdminAddItem extends StatefulWidget {
  const AdminAddItem({super.key});

  @override
  State<AdminAddItem> createState() => _AdminAddItemState();
}

class _AdminAddItemState extends State<AdminAddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Scan atau Masukkan Barcode", true),
      backgroundColor: const Color(0xFF9DBBD0),
      body: const Center(
        child: BuildTextFieldScan(),
      ),
    );
  }
}
