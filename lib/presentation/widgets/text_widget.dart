import 'package:flutter/material.dart';

Widget buildText(String text, double size, color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontFamily: "BalooChettan2",
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

Widget buildText2(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontFamily: "BalooChettan2",
    ),
  );
}