import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/icon_widget.dart';
import 'package:ritoselfcheckout/presentation/widgets/text_widget.dart';
import '../../widgets/build_row.dart';
import '../../widgets/item_card_widget.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

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
                child: RawScrollbar(
                  thumbColor: const Color(0xFF002947),
                  thickness: 10,
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return cardWidget(context);
                    },
                  ),
                ),
              ),
            ),
          ),
          // Bagian Kedua (Setengah Layar)
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
                        mainAxisAlignment: MainAxisAlignment.start, // Menengahkan column vertikal
                        children: <Widget>[
                          Column(
                            children: [
                              buildRow("Jumlah Barang", "10"),
                              buildRow("Total Harga", "Rp. 999.999"),
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


