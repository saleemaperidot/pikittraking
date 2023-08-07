import 'package:get/get.dart';
import 'package:pikittraking/Model/user_info/user_info.dart';
import 'package:pikittraking/services/updateuser_service.dart';

class UpdateUserController extends GetxController {
  Rx<UserInfo> userData = UserInfo().obs;
  Rx<bool> isLoading = false.obs;
  getUserInfo() async {
    try {
      isLoading.value = true;
      UserInfo userInformation = await UpdateUserService().updateUser();
      print("user$userInformation");
      userData.value = UserInfo();
      userData.value = userInformation;
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
    // TODO: implement onInit
  }
}
