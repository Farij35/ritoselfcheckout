import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/screens/admin/admin_choose_input_item.dart';
import 'package:ritoselfcheckout/presentation/screens/admin/admin_dashboard.dart';
import 'package:ritoselfcheckout/presentation/screens/admin/admin_item_data.dart';
import 'package:ritoselfcheckout/presentation/screens/admin/admin_sales_data.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_user_data.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_icon.dart';
import 'package:ritoselfcheckout/presentation/widgets/widget_text.dart';
import '../screens/customer/main_screen.dart';

Widget drawerWidget(context) {
  return Drawer(
    child: Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF002947),
              ),
              child: Center(
                child: Column(
                  children: [
                    buildIcon(Icons.account_circle, Colors.white, 80),
                    buildUserData()
                  ],
                ),
              ),
            ),
            drawerNavigation(context, null, const AdminDashboard(), const Icon(Icons.home_rounded), 'Dashboard'),
            drawerNavigation(context, null, const AdminItemData(), const Icon(Icons.all_inbox_rounded), 'Data Barang'),
            drawerNavigation(context, null, const AdminSalesData(), const Icon(Icons.show_chart_rounded), 'Data Sales'),
            drawerNavigation(context, null, const ChooseInputItem(), const Icon(Icons.barcode_reader), 'Input Barang'),
            drawerNavigation(context, FirebaseAuth.instance.signOut(), const MainScreen(), const Icon(Icons.logout_rounded), 'Logout'),
          ],
        ),
        buildLoadingIndicator(),
      ],
    ),
  );
}


Widget drawerNavigation(context, logout, destination, icon, String text) {
  return InkWell(
    onTap: () {
      logout;
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination));
    },
    child: ListTile(
      leading: icon,
      title: buildText2(text),
    ),
  );
}

