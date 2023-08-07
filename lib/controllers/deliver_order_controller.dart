import 'package:get/get.dart';
import 'package:pikittraking/services/delivered_service.dart';

class DeliverOrderController extends GetxController {
  Rx<bool> isLoading = false.obs;

  Rx<bool> deliverindicator = false.obs;
  @override
  void onInit() {
    super.onInit();

    //response.bindStream(login());
  }

  DeliverOrder(int orderId) async {
    try {
      isLoading.value = true;
      final response = await DeliveredOdersService().DeliveredOrders(orderId);
      print("indicator in controller$response");
      deliverindicator.value = response;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
