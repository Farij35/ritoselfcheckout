import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_textfield.dart';
import '../../widgets/item_card_widget.dart';

class AdminItemData extends StatelessWidget {
  const AdminItemData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Data Barang", true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextField(context, 2, ItemSearchController.searchController, 'Cari Barang', false),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return cardWidget(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
