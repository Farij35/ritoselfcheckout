import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/data/datasources/remote/firestore_store_transaction.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_icon.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_text.dart';
import '../../widgets/widget_row.dart';
import '../../widgets/widget_item_card.dart';

class ReviewScreen extends StatelessWidget {
  final int totalPrice;
  final int totalQty;
  const ReviewScreen({super.key, required this.totalPrice, required this.totalQty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Batal", false),
      body: Row(
        children: [
          // Bagian Pertama (Setengah Layar)
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {},
              child: Container(
                color: const Color(0xFF014A7E),
                child: const RawScrollbar(
                  thumbColor: Color(0xFF002947),
                  thickness: 10,
                  thumbVisibility: true,
                  child: GetTransactionItems()
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: const Color(0xFF9DBBD0),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: [
                              buildRow("Jumlah Barang", totalQty.toString()),
                              buildRow("Total Harga", totalPrice.toString()),
                              buildRow("Diskon", "Rp. 0"),
                              const Divider(height: 20, thickness: 5, indent: 0, endIndent: 350, color: Colors.black),
                              buildRow("Total", "Rp. 999.999", isRed: true, fontSize: 50),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {},
                    child: BottomAppBar(
                      color: const Color(0xFF050034),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: buildText('Bayar', 40, Colors.white)
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: buildIcon(Icons.arrow_forward_rounded, Colors.white, 60),
                            ),
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


