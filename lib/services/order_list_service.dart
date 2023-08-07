import 'package:dio/dio.dart';
import 'package:pikittraking/Apis/ApiEndPoints.dart';
import 'package:pikittraking/Model/accepted_order_model/accepted_order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderListService {
  orderlist() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('auth_token') ?? "";
    print("token$token");
    final response = await Dio(BaseOptions()).post(
        ApiEndPoints.API_URL + ApiEndPoints.getdeliveryorders,
        data: {"token": token});

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.data);
      final acceptedorders = response.data['accepted_orders'];
      // pickedup = response.data['pickedup_orders'];
      final orderList = (acceptedorders as List)
          .map((e) => AcceptedOrder.fromJson(e))
          .toList();
      print("accepted orders$orderList");
      // AcceptedOrder acceptedList = AcceptedOrder.fromJson(acceptedorders);
      return orderList;
    }
  }

  pickeduporders() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('auth_token') ?? "";
    print("token$token");
    final response = await Dio(BaseOptions()).post(
        ApiEndPoints.API_URL + ApiEndPoints.getdeliveryorders,
        data: {"token": token});

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.data);
      //  final acceptedorders = response.data['accepted_orders'];
      final pickedup = response.data['pickedup_orders'];
      final pickedlist =
          (pickedup as List).map((e) => AcceptedOrder.fromJson(e)).toList();
      print("picked orders$pickedlist");
      // AcceptedOrder acceptedList = AcceptedOrder.fromJson(acceptedorders);
      return pickedlist;
    }
  }
}
