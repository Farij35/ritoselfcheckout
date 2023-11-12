import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_button.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_textfield.dart';
import '../../widgets/big_item_card_widget.dart';
import '../../widgets/build_sizedbox.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Scan Atau Masukkan Barcode", true),
      backgroundColor: const Color(0xFF9DBBD0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextField(context, 2, BarcodeController.barcodeController, "Kode Barcode", false),
            buildSizedBox(20, 0),
            bigCardWidget(context, "Nama Barang", "Rp. 999.999", "0", "barcode", 2),
            buildSizedBox(20, 0),
            buildButton("Hapus", Colors.red, () { })
          ],
        ),
      ),
    );
  }
}
