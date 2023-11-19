import 'package:flutter/material.dart';

class TextfieldSearch extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String labelText;
  const TextfieldSearch({super.key, required this.onChanged, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontFamily: "BalooChettan2",
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
