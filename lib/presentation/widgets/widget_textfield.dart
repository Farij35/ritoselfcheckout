import 'package:flutter/material.dart';

Widget buildTextField(context, int scrwidth, TextEditingController controller, String label, bool obsText) {
  double screenWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: screenWidth / scrwidth,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: "BalooChettan2",
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      obscureText: obsText,
    ),
  );
}


// child: TextField(
//   onChanged: widget.onChanged,
//   decoration: const InputDecoration(
//     border: OutlineInputBorder(),
//     labelText: "Scan atau Masukkan Barcode",
//     labelStyle: TextStyle(
//       fontFamily: "BalooChettan2",
//     ),
//     filled: true,
//     fillColor: Colors.white,
//   ),
// ),
