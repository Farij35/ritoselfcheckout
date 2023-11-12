import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/screens/customer/review_screen.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_textfield.dart';
import 'package:ritoselfcheckout/presentation/widgets/icon_widget.dart';
import 'package:ritoselfcheckout/presentation/widgets/text_widget.dart';
import '../../widgets/big_item_card_widget.dart';
import '../../widgets/build_sizedbox.dart';
import '../../widgets/item_card_widget.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Scan Atau Masukkan Kode Barcode", true),
      body: Row(
        children: [
          // Bagian Pertama (Setengah Layar)
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFF9DBBD0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTextField(context, 2, BarcodeController.barcodeController, "Kode Barcode", false),
                    buildSizedBox(20, 0),
                    bigCardWidget(context, "Nama Barang", "Harga Barang", "qty", "barcode", 2),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: const Color(0xFF014A7E),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return cardWidget(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ReviewScreen()));
                    },
                    child: Container(
                      color: const Color(0xFF002947),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            buildText('Rp. 999.999', 28, Colors.white),
                            buildIcon(Icons.arrow_forward_rounded, Colors.white, 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
