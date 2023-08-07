import 'dart:math';

import 'package:get/get.dart';
import 'package:pikittraking/Model/single_order_model/single_order_model.dart';
import 'package:pikittraking/services/pikedup_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PickedUPController extends GetxController {
  Rx<SingleOrderModel> pickedup = SingleOrderModel().obs;
  late int orderid;
  Rx<bool> isLoading = false.obs;
  getSingleOrder() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("auth_token");
    final data = {"token": token, "order_id": orderid};
    print("pickeuptocken$data");
    try {
      isLoading.value = true;
      SingleOrderModel pickedupresponse = await PickedUpService().pickup(data);
      print("SingleOrderModel$pickedupresponse");

      pickedup.value = pickedupresponse;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSingleOrder();
    // TODO: implement onInit
  }
}
