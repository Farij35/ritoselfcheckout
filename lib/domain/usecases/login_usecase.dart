import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/screens/admin/admin_dashboard.dart';

Future <void> login(context) async {
  final auth = FirebaseAuth.instance;
  try {
    await auth.signInWithEmailAndPassword(
        email: LoginController.emailController.text,
        password: LoginController.passwordController.text
    );
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminDashboard()));
    clearLoginControllers();
  } on FirebaseAuthException catch (signInError) {
    if (signInError.code == 'invalid-login-credentials') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username atau Password Salah'),
        ),
      );
    } else if (signInError.code == 'operation-not-allowed') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Akun jenis ini belum diaktifkan'),
        ),
      );
    } else if (signInError.code == 'user-disabled') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pengguna dengan kredensial ini telah dinonaktifkan'),
        ),
      );
    } else if (signInError.code == 'missing-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap masukkan password'),
        ),
      );
    } else if (signInError.code == 'invalid-email') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email tidak valid'),
        ),
      );
    }
  }
}