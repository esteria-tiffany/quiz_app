import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/components/custom_button.dart';
import 'package:quiz_app/app/constants/app_color.dart';
import 'package:quiz_app/app/constants/app_image.dart';
import '../../../constants/app_font.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';



class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

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
                    'Sign Up',
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
                  const SizedBox(height: 20),
                  // Confirm Password Input
                  TextField(
                    controller: controller.confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: AppFont.regular.copyWith(
                        color: AppColor.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.purple1),
                      ),
                      hintText: 'Re-enter your password',
                      hintStyle: TextStyle(color: AppColor.white.withOpacity(0.7)),
                    ),
                    style: TextStyle(color: AppColor.white),
                  ),
                  const SizedBox(height: 40),
                  // Sign Up Button
                  Obx(() => controller.isLoading.value
                      ? CircularProgressIndicator(color: AppColor.purple1)
                      : CustomButton(
                    onPressed: controller.signup,
                    text: 'Sign Up',
                  )),
                  const SizedBox(height: 20),
                  // Additional Option (e.g., Back to Login)
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text(
                      'Already have an account? Login',
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
