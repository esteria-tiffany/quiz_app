import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/components/custom_button.dart';
import 'package:quiz_app/app/constants/app_color.dart';
import 'package:quiz_app/app/constants/app_image.dart';
import '../../../constants/app_font.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: SvgPicture.asset(
              AppImage.bg,
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    'Login',
                    style: AppFont.bold.copyWith(
                      color: AppColor.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Username Input
                  TextField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: AppFont.regular.copyWith(
                        color: AppColor.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.purple1),
                      ),
                      hintText: 'Enter your username',
                      hintStyle: TextStyle(color: AppColor.white.withOpacity(0.7)),
                    ),
                    style: TextStyle(color: AppColor.white),
                  ),
                  const SizedBox(height: 20),
                  // Password Input
                  TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: AppFont.regular.copyWith(
                        color: AppColor.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.purple1),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: AppColor.white.withOpacity(0.7)),
                    ),
                    style: TextStyle(color: AppColor.white),
                  ),
                  const SizedBox(height: 40),
                  // Login Button
                  Obx(() => controller.isLoading.value
                      ? CircularProgressIndicator(color: AppColor.purple1)
                      : CustomButton(
                    onPressed: controller.login,
                    text: 'Login',
                  )),
                  const SizedBox(height: 20),
                  // Additional Option (e.g., Sign Up)
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                    child: Text(
                      'Don’t have an account? Sign Up',
                      style: AppFont.regular.copyWith(color: AppColor.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
