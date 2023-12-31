import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_sizedbox.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_icon.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_text.dart';

Widget bigCardWidget(context, String nama, String harga, String qty, String barcode, int scrwidth) {
  double screenWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: screenWidth / scrwidth,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: SizedBox(width: 100, height: 50,
                child: buildIcon(Icons.image, null, 55)
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildText(nama, 20, Colors.black),
                  buildSizedBox(10, 0)
                ],
              ),
              subtitle: buildText("Rp. $harga", 30, Colors.red),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                buildText2("qty : $qty"),
                buildSizedBox(0, 20),
                buildText2(barcode)
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
