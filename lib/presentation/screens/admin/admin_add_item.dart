import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_button.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_textfield.dart';
import '../../widgets/big_item_card_widget.dart';
import '../../widgets/build_sizedbox.dart';

class AdminAddItem extends StatelessWidget {
  const AdminAddItem({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar("Scan atau Masukkan Barcode", true),
      backgroundColor: const Color(0xFF9DBBD0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextField(context, 2, BarcodeController.barcodeController, "Scan atau Masukkan Barcode", false),
            buildSizedBox(20, 0),
            bigCardWidget(context, 2),
            buildSizedBox(20, 0),
            buildButton("Tambah", const Color(0xFF002947), () { })
          ],
        ),
      ),
    );
  }
}
