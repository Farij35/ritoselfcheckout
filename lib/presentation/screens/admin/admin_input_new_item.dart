import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/data/datasources/remote/firestore_add_data.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_button.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_sizedbox.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_textfield.dart';

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
            buildButton('Input', const Color(0xFF014A7E), () {
              addData('items_data', NewItemInputController.barcodeController.text, itemsData);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Barang berhasil ditambahkan'),
                ),
              );
              clearInputItemControllers();
            }),
          ],
        ),
      ),
    );
  }
}
