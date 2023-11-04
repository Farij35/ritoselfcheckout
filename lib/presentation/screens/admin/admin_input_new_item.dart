import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import '../../widgets/build_button.dart';
import '../../widgets/build_sizedbox.dart';
import '../../widgets/build_textfield.dart';

class AdminInputItem extends StatelessWidget {
  const AdminInputItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Scan atau Masukkan Barcode", true),
      backgroundColor: const Color(0xFF9DBBD0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextField(context, 4, NewItemInputController.barcodeController, 'Kode Barcode', false),
            buildSizedBox(20, 0),
            buildTextField(context, 4, NewItemInputController.itemNameController, 'Nama Barang', false),
            buildSizedBox(20, 0),
            buildTextField(context, 4, NewItemInputController.itemPriceController, 'Harga Barang', false),
            buildSizedBox(20, 0),
            buildButton('Input', const Color(0xFF014A7E), () {} ),
          ],
        ),
      ),
    );
  }
}
