import 'package:get/get.dart';
import 'package:pikittraking/Model/single_order_model/single_order_model.dart';
import 'package:pikittraking/services/get_single_order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleOrderController extends GetxController {
  Rx<SingleOrderModel> singleOrder = SingleOrderModel().obs;
  late String orderid;
  Rx<bool> isLoading = false.obs;
  getSingleOrder() async {
    try {
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString("auth_token");
      final data = {"token": token, "unique_order_id": orderid};
      SingleOrderModel singleOrderModelresponse =
          await SingleOrderService().gtSingleOrder(data);
      print("SingleOrderModel$singleOrderModelresponse");

      singleOrder.value = singleOrderModelresponse;
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
