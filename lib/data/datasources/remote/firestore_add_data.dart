import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';

double itemPrice = double.tryParse(NewItemInputController.itemPriceController.text) ?? 0.0;

final itemsData = <String, dynamic> {
  "barcode": NewItemInputController.barcodeController.text,
  "nama_barang": NewItemInputController.itemNameController.text,
  "harga_barang": itemPrice,
  "qty": 0
};

Future<void> addData(String collection, String docId, Map<String, dynamic> data) async {
  await FirebaseFirestore.instance
      .collection(collection)
      .doc(docId)
      .set(data);
}