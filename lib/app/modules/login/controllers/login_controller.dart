import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  @override
  void onClose() {
    // Membersihkan controller saat tidak digunakan
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Fungsi untuk login
  Future<void> login() async {
    isLoading.value = true;
    try {
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();

      if (username.isEmpty || password.isEmpty) {
        Get.snackbar("Error", "Username and password cannot be empty!",
            snackPosition: SnackPosition.BOTTOM);
        isLoading.value = false;
        return;
      }

      // Contoh validasi sederhana (bisa diubah sesuai kebutuhan)
      if (username == "admin" && password == "12345") {
        // Simpan login ke SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("username", username);

        // Pindah ke halaman berikutnya
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Error", "Invalid username or password!",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk logout (opsional jika diperlukan)
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
