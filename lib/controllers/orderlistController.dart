import 'package:get/get.dart';
import 'package:pikittraking/Model/accepted_order_model/accepted_order.dart';
import 'package:pikittraking/Model/single_order_model/single_order_model.dart';
import 'package:pikittraking/services/get_single_order.dart';
import 'package:pikittraking/services/order_list_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderListController extends GetxController {
  RxList<AcceptedOrder> acceptedOrders = <AcceptedOrder>[].obs;
  Rx<bool> isLosding = false.obs;
  OrderList() async {
    try {
      acceptedOrders.clear();
      isLosding.value = true;
      List<AcceptedOrder> result = await OrderListService().orderlist();
      //
      print("result$result");
      acceptedOrders.addAll(result);
    } catch (e) {
      print(e);
    } finally {
      isLosding.value = false;
    }
    // final accepterorders = result['accepted_orders'];
    // print("accepterorders$accepterorders");
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // OrderList();

    //  acceptedOrders.bindStream(await OrderListService().orderlist());
  }
}
