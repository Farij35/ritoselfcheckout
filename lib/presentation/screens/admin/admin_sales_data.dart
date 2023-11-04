import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';

class AdminSalesData extends StatelessWidget {
  const AdminSalesData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Data Sales', true),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: const Center(child: Text('Pojok Kiri Atas')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: const Center(child: Text('Pojok Kanan Atas')),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: const Center(child: Text('Pojok Kiri Bawah')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: const Center(child: Text('Pojok Kanan Bawah')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
