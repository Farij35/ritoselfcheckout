import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/controllers/text_field_controller.dart';
import 'package:ritoselfcheckout/presentation/screens/admin/admin_login.dart';

Future <void> signUp(context) async {
  final auth = FirebaseAuth.instance;
  final credential = <String, dynamic> {
    "email": SignUpController.emailController.text,
    "nik": SignUpController.nikController.text,
    "nama": SignUpController.nameController.text
  };

  Map<TextEditingController, String> controllers = {
    SignUpController.nikController: 'NIK Tidak Boleh Kosong',
    SignUpController.nameController: 'Nama Tidak Boleh Kosong',
    SignUpController.passwordController: 'Harap Buat Password',
    SignUpController.confirmPasswordController: 'Harap ketik ulang password anda untuk mengkonfirmasi',
  };

  for (var entry in controllers.entries) {
    if (entry.key.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(entry.value),
        ),
      );
      return;
    }
  }

  if (SignUpController.passwordController.text !=
      SignUpController.confirmPasswordController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password Tidak Sama'),
      ),
    );
    return;
  }

    try {
    UserCredential docId = await auth.createUserWithEmailAndPassword(
        email: SignUpController.emailController.text,
        password: SignUpController.passwordController.text
    );
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('user_credential').doc(docId.user?.uid).set(credential);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminLogin()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Berhasil Membuat Akun. Silahkan Login'),
      ),
    );
    clearSignUpControllers();
  } on FirebaseAuthException catch (signUpError) {
    if (signUpError.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Sudah Terdaftar'),
        ),
      );
    } else if (signUpError.code == 'invalid-email') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email tidak valid'),
        ),
      );
    } else if (signUpError.code == 'missing-email') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap Buat Email'),
        ),
      );
    } else if (signUpError.code == 'missing-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pengguna dengan kredensial ini telah dinonaktifkan'),
        ),
      );
    } else if (signUpError.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tidak ada pengguna yang sesuai dengan kredensial ini'),
        ),
      );
    } else if (signUpError.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password terlalu lemah'),
        ),
      );
    } else if (signUpError.code == 'account-exists-with-different-credential') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email sudah dikaitkan dengan akun lain'),
        ),
      );
    } else if (signUpError.code == 'credential-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Akun sudah ada untuk kredensial ini'),
        ),
      );
    }
  }
}
