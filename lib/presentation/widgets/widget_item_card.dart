import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_sizedbox.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_icon.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_text.dart';

Widget cardWidget(context, String name, String price, String qty, String barcode) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: buildIcon(Icons.image, Colors.black, 55),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildText2(name),
                buildSizedBox(10, 0)
              ],
            ),
            subtitle: buildText("Rp. $price", 24, Colors.red),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              buildText2('Qty : $qty'),
              buildSizedBox(0, 20),
              buildText2(barcode)
            ],
          ),
        ],
      ),
    ),
  );
}

