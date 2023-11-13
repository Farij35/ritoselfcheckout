import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/widgets/items_data_widget.dart';

class BuildTextFieldScan extends StatefulWidget {
  const BuildTextFieldScan({super.key});

  @override
  State<BuildTextFieldScan> createState() => _BuildTextFieldScanState();
}

class _BuildTextFieldScanState extends State<BuildTextFieldScan> {
  Widget? itemsData;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          width: screenWidth / 2,
          child: TextFormField(
            controller: BarcodeController.barcodeController,
            enabled: true,
            autofocus: true,
            autocorrect: false,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            onFieldSubmitted: (val) {
              setState(() {
                itemsData = itemsDataWidget();
              });
              BarcodeController.barcodeController.clear();
              FocusNode().requestFocus();
            },
          ),
        ),
        if (itemsData != null) itemsData!,
      ],
    );
  }
}
