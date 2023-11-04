import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/domain/usecases/signup_usecase.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_button.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_sizedbox.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_textfield.dart';

class AdminSignup extends StatelessWidget {
  const AdminSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Daftar Karyawan Baru", true),
      backgroundColor: const Color(0xFF9DBBD0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            buildTextField(context, 4, SignUpController.emailController, 'Email', false),
            buildSizedBox(20, 0),
            buildTextField(context, 4, SignUpController.nikController, 'NIK', false),
            buildSizedBox(20, 0),
            buildTextField(context, 4, SignUpController.nameController, 'Nama', false),
            buildSizedBox(20, 0),
            buildTextField(context, 4, SignUpController.passwordController, 'Password', true),
            buildSizedBox(20, 0),
            buildTextField(context, 4, SignUpController.confirmPasswordController, 'Konfirmasi Password', true),
            buildSizedBox(20, 0),
            buildButton("Daftar", const Color(0xFF002947), () {
              signUp(context);
            }),
          ],
        ),
      ),
    );
  }
}
