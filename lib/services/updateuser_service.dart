import 'package:dio/dio.dart';
import 'package:pikittraking/Apis/ApiEndPoints.dart';
import 'package:pikittraking/Model/user_info/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateUserService {
  updateUser() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final auth = preferences.getString("auth_token");
      final id = preferences.getInt("id");

      final data = {"token": auth, "user_id": id};
      print(data);
      final response = await Dio(BaseOptions())
          .post(ApiEndPoints.API_URL + ApiEndPoints.updateuserinfo, data: data);
      print(response);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final result = UserInfo.fromJson(response.data);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
