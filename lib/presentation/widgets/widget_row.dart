import 'package:flutter/material.dart';

Widget buildRow(String title, String value, {bool isRed = false, double fontSize = 30}) {
  return Row(
    children: [
      SizedBox(
        width: 300,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            fontFamily: "BalooChettan2",
          ),
        ),
      ),
      SizedBox(
        width: 20,
        child: Text(
          ':',
          style: TextStyle(fontSize: fontSize),
        ),
      ),
      SizedBox(
        width: 400,
        child: Text(
          value,
          style: TextStyle(
            fontFamily: "BalooChettan2",
            fontSize: fontSize,
            fontWeight: isRed ? FontWeight.bold : FontWeight.normal,
            color: isRed ? Colors.red : Colors.black,
          ),
        ),
      ),
    ],
  );
}