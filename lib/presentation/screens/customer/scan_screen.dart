import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/data/datasources/remote/firestore_store_transaction.dart';
import 'package:ritoselfcheckout/presentation/screens/customer/review_screen.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_textfield_scan.dart';
import 'package:ritoselfcheckout/presentation/widgets/icon_widget.dart';
import 'package:ritoselfcheckout/presentation/widgets/text_widget.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_appbar_scan.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBarScan(context, "Scan atau Masukkan Barcode", true),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFF9DBBD0),
              child: const  Center(
                child: BuildTextFieldScan(),
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
                    child: const GetTransactionItems(),
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
