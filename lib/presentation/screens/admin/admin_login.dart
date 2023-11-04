import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/domain/usecases/login_usecase.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_button.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_textfield.dart';
import '../../widgets/build_sizedbox.dart';
import 'admin_signup.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("RitoAdministrator", true),
      backgroundColor: const Color(0xFF9DBBD0),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextField(context, 4, LoginController.emailController, 'Email', false),
                buildSizedBox(20, 0),
                buildTextField(context, 4, LoginController.passwordController, 'Password', true),
                buildSizedBox(20, 0),
                buildButton('Login', const Color(0xFF002947), () async {
                  setState(() {
                    _isLoading = true; // Set _isLoading ke true saat tombol ditekan
                  });
                  await login(context);
                  setState(() {
                    _isLoading = false; // Set _isLoading ke false setelah Future selesai
                  });
                }),
                buildSizedBox(20, 0),
                buildButton('Daftar Karyawan Baru', const Color(0xFF014A7E), () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminSignup()));
                }),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
