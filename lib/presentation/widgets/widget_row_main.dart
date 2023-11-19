import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_sizedbox.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_icon.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_text.dart';
import 'package:ritoselfcheckout/presentation/screens/customer/check_screen.dart';
import 'package:ritoselfcheckout/presentation/screens/customer/scan_screen.dart';
import 'package:ritoselfcheckout/presentation/screens/customer/topup_screen.dart';

Widget buildRowMain(String title, bool isForwardIcon, BuildContext context) {
  return InkWell(
    onTap: () {
      if (title == 'Scan Now') {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScanScreen()));
      } else if (title == 'Top Up Saldo') {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TopUpScreen()));
      } else if (title == 'Cek Harga') {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckScreen()));
      }
    },
    child: Container(
      color: title == 'Scan Now'
          ? const Color(0xFF9DBBD0)
          : title == 'Top Up Saldo'
          ? const Color(0xFF014A7E)
          : const Color(0xFF002947),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title == 'Scan Now')
            Image.asset(
              '../assets/barcode_icon.png',
              width: 200,
              height: 200,
            ),
          buildSizedBox(10, 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildText(title, 24, title == 'Scan Now' ? Colors.black : Colors.white),
              if (isForwardIcon)
                buildIcon(Icons.arrow_forward_rounded, Colors.white, 24)
            ],
          ),
        ],
      ),
    ),
  );
}
