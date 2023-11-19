import 'package:flutter/material.dart';

Widget buildButton(String text, Color color, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontFamily: "BalooChettan2",
      ),
    ),
  );
}