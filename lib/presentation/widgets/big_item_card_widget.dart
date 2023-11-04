import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_sizedbox.dart';
import 'package:ritoselfcheckout/presentation/widgets/icon_widget.dart';
import 'package:ritoselfcheckout/presentation/widgets/text_widget.dart';

Widget bigCardWidget(context, int scrwidth) {
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
                  buildText('Nama Barang', 20, Colors.black),
                  buildSizedBox(10, 0)
                ],
              ),
              subtitle: buildText('Rp. 999.999', 30, Colors.red),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
      ),
    ),
  );
}