import 'package:flutter/material.dart';

class LoginController {
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
}

class SignUpController {
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController nikController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  static final TextEditingController confirmPasswordController = TextEditingController();
}

class NewItemInputController {
  static final TextEditingController barcodeController = TextEditingController();
  static final TextEditingController itemNameController = TextEditingController();
  static final TextEditingController itemPriceController = TextEditingController();
}

class ItemSearchController {
  static final TextEditingController searchController = TextEditingController();
}

class BarcodeController {
  static final TextEditingController barcodeController = TextEditingController();
}

void clearSignUpControllers() {
  List<TextEditingController> controllers = [
    SignUpController.emailController,
    SignUpController.nikController,
    SignUpController.nameController,
    SignUpController.passwordController,
    SignUpController.confirmPasswordController,
  ];

  for (TextEditingController controller in controllers) {
    controller.clear();
  }
}

void clearLoginControllers() {
  List<TextEditingController> controllers = [
    LoginController.emailController,
    LoginController.passwordController
  ];

  for (TextEditingController controller in controllers) {
    controller.clear();
  }
}

void clearInputItemControllers() {
  List<TextEditingController> controllers = [
    NewItemInputController.barcodeController,
    NewItemInputController.itemNameController,
    NewItemInputController.itemPriceController,
  ];

  for (TextEditingController controller in controllers) {
    controller.clear();
  }
}

