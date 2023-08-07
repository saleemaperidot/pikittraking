import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxString light = "Light".obs;
  RxString dart = "Dark".obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}
