import 'package:flutter/material.dart';

class BuildTextFieldScan extends StatefulWidget {
  final Function(String) onChanged;
  const BuildTextFieldScan({super.key, required this.onChanged});

  @override
  State<BuildTextFieldScan> createState() => _BuildTextFieldScanState();
}

class _BuildTextFieldScanState extends State<BuildTextFieldScan> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth / 2,
      child: TextField(
        onChanged: widget.onChanged,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Scan atau Masukkan Barcode",
          labelStyle: TextStyle(
            fontFamily: "BalooChettan2",
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
