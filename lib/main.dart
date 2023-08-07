import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pikittraking/Presentation/Screens/login.dart';
import 'package:pikittraking/controllers/login_controller.dart';
import 'package:pikittraking/controllers/theme_controller.dart';
import 'package:pikittraking/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController _themeController = Get.put(ThemeController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,

      // Set the initial light theme

      title: 'Flutter Demo',
      home: Login(),
    );
  }
}

class Root extends StatelessWidget {
  Root({super.key});
  LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print("Obx${_loginController.response}");
      return _loginController.response == true ? Home() : Login();
    });
  }
}
