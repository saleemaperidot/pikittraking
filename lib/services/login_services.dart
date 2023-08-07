import 'package:dio/dio.dart';
import 'package:pikittraking/Apis/ApiEndPoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServices {
  login(dynamic data) async {
    try {
      final response = await Dio(BaseOptions())
          .post(ApiEndPoints.API_URL + ApiEndPoints.login, data: data);
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = response.data;
        final authToken = result['data']['auth_token'];
        int id = result['data']['id'];
        final wallet_balance = result['data']['wallet_balance'];
        final onGoingCount = result['data']['onGoingCount'];
        final completedCount = result['data']['completedCount'];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("auth_token", authToken ?? "");
        pref.setInt("id", id);
        pref.setInt("wallet_balance", wallet_balance);
        pref.setInt("onGoingCount", onGoingCount);
        pref.setInt("completedCount", completedCount);
        print(result['success']);
        return result['success'];
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
