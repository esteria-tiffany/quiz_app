import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Fungsi untuk sign up
  Future<void> signup() async {
    isLoading.value = true;
    try {
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();

      if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        Get.snackbar("Error", "All fields are required!",
            snackPosition: SnackPosition.BOTTOM);
        isLoading.value = false;
        return;
      }

      if (password != confirmPassword) {
        Get.snackbar("Error", "Passwords do not match!",
            snackPosition: SnackPosition.BOTTOM);
        isLoading.value = false;
        return;
      }

      // Simpan data pengguna ke SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", username);
      await prefs.setString("password", password);

      Get.snackbar("Success", "Account created successfully!",
          snackPosition: SnackPosition.BOTTOM);

      // Navigasi ke halaman login
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
