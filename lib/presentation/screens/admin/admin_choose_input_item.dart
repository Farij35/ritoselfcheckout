import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/screens/admin/admin_add_item.dart';
import 'package:ritoselfcheckout/presentation/screens/admin/admin_input_new_item.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/menu_card_widget.dart';

class ChooseInputItem extends StatelessWidget {
  const ChooseInputItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Input Barang", true),
      backgroundColor: const Color(0xFF9DBBD0),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 20.0, // jarak antar widget dalam satu baris atau kolom
          runSpacing: 20.0, // jarak antar baris atau kolom
          children: List.generate(2, (int index) {
            List<String> texts = ['Tambah Stok Barang', 'Input Barang Baru'];
            return InkWell(
              onTap: () {
                index == 0
                  ? Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminAddItem()))
                  : index == 1
                  ? Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminInputItem()))
                  : null;
              },
              splashColor: Colors.white,
              hoverColor: Colors.white,
              child: menuCard(150, 300, texts, index),
            );
          }),
        ),
      ),
    );
  }
}
