import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pikittraking/home.dart';
import 'package:pikittraking/services/login_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var email;

  var password;
  Rx<bool> isLoading = true.obs;
  var response = false.obs;
  @override
  void onInit() {
    super.onInit();
    //response.bindStream(login());
  }

  login() async {
    dynamic data = {"email": email, "password": password};
    try {
      isLoading.value = true;
      var responsedata = await LoginServices().login(data);
      var res = responsedata.toString();
      print("res$res");

      return res;
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }

    // response == true ? Get.to(Home()) : SizedBox();
  }
}
