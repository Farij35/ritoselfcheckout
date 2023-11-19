import 'package:flutter/material.dart';

AppBar buildAppBar(String title, bool position) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontFamily: "BalooChettan2"),
    ),
    backgroundColor: const Color(0xFF002947),
    centerTitle: position,
  );
}
