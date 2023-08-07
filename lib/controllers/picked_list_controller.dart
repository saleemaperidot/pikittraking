import 'dart:math';

import 'package:get/get.dart';
import 'package:pikittraking/services/order_list_service.dart';

import '../Model/accepted_order_model/accepted_order.dart';

class PickedListController extends GetxController {
  RxList<AcceptedOrder> pikedlist = <AcceptedOrder>[].obs;
  Rx<bool> isLoading = false.obs;
  OrderList() async {
    print("calling");
    try {
      pikedlist.clear();
      isLoading.value = true;
      List<AcceptedOrder> result = await OrderListService().pickeduporders();
      //
      print("result picked list$result");
      pikedlist.addAll(result);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
    // final accepterorders = result['accepted_orders'];
    // print("accepterorders$accepterorders");
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    //  OrderList();

    //  acceptedOrders.bindStream(await OrderListService().orderlist());
  }
}
