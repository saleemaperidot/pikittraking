import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pikittraking/Apis/ApiEndPoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveredOdersService {
  bool deliveredIndicator = false;

  DeliveredOrders(int orderid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("auth_token");
    final data = {"delivery_pin": "", "order_id": orderid, "token": token};
    print(data);
    try {
      final response = await Dio(BaseOptions())
          .post(ApiEndPoints.API_URL + ApiEndPoints.deliverorder, data: data);
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //deliveredIndicator = true;
        print("service");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
