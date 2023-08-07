import 'package:dio/dio.dart';
import 'package:pikittraking/Apis/ApiEndPoints.dart';
import 'package:pikittraking/Model/single_order_model/single_order_model.dart';

class PickedUpService {
  pickup(dynamic data) async {
    // print(ApiEndPoints.API_URL + ApiEndPoints.pickeduporder);
    try {
      final response = await Dio(BaseOptions())
          .post(ApiEndPoints.API_URL + ApiEndPoints.pickeduporder, data: data);
      print("single order$response");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SingleOrderModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
