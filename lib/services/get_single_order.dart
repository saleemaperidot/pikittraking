import 'package:dio/dio.dart';
import 'package:pikittraking/Apis/ApiEndPoints.dart';
import 'package:pikittraking/Model/single_order_model/single_order_model.dart';

class SingleOrderService {
  gtSingleOrder(dynamic data) async {
    try {
      final response = await Dio(BaseOptions()).post(
          ApiEndPoints.API_URL + ApiEndPoints.getsingledeliveryorder,
          data: data);
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
