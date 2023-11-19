import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_menu_card.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Topup Saldo", true),
      backgroundColor: const Color(0xFF9DBBD0),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 30 / 20,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          List<String> texts = ['10.000', '20.000', '50.000', '100.000', '200.000', '500.000'];
          return Padding(
            padding: const EdgeInsets.all(60.0),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.white,
              hoverColor: Colors.white,
              child: menuCard(10, 30, texts, index)
            ),
          );
        },
      ),
    );
  }
}


