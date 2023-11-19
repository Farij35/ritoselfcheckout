import 'package:flutter/material.dart';
import '../../widgets/widget_row_main.dart';
import '../admin/admin_login.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: buildRowMain('Scan Now', false, context),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: buildRowMain('Top Up Saldo', true, context),
                ),
                Expanded(
                  flex: 1,
                  child: buildRowMain('Cek Harga', true, context),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF050034),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                      onDoubleTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminLogin()));
                      },
                      child: const Icon(
                        Icons.key,
                        color: Colors.white,
                      )),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));
                },
                child: const Text(
                  'RitoSelfCheckout',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "BalooChettan2",
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
