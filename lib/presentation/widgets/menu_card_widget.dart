import 'package:flutter/material.dart';

Widget menuCard (double height, double width, List text, int index) {
  return Card(
    color: const Color(0xFF002947),
    child: SizedBox(
      width: width,
      height: height,
      child: Center(
        child: Text(
          text[index],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "BalooChettan2",
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}