import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pikittraking/Model/user_info/user_info.dart';
import 'package:pikittraking/Presentation/widgets/earnings_widget.dart';
import 'package:pikittraking/Presentation/widgets/line_chart_widget.dart';
import 'package:pikittraking/Presentation/widgets/orders_widget.dart';
import 'package:pikittraking/constant/datediff.dart';
import 'package:pikittraking/controllers/theme_controller.dart';
import 'package:pikittraking/controllers/update_user_controller.dart';

class Account extends StatelessWidget {
  Account({super.key});
  UpdateUserController userinfoController = Get.put(UpdateUserController());

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();
    final user = userinfoController.userData;

    DateTime givenDateTime = DateTime(2023, 7, 18, 9, 31, 40);
    String timeDifference = getTimeDifference(givenDateTime);
    print(timeDifference);
    print("user in presentation$user");
    return SingleChildScrollView(
      child: Obx(
        () => ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            Container(
              color: Colors.blueGrey,
              child: ListTile(
                leading: Text(
                  user.value.data!.name!,
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.refresh),
                  label: Text("Refresh"),
                ),
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dark/light theme"),
                  Switch(
                    value: _themeController.isDarkMode.value,
                    onChanged: (value) {
                      _themeController.toggleTheme();
                      value
                          ? Get.changeTheme(ThemeData.light())
                          : Get.changeTheme(ThemeData.dark());
                    },
                  ),
                ],
              ),
            ),
            //Line Chart
            Text("Last 7 days Earnings"),
            Container(child: LineChartWidget()),
            EarningsWidget(),
            Container(
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  color: Colors.blueGrey,
                  child: Text(
                    "Rs ${user.value.data!.deliveryCollection!}\n COD IN HAND",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Container(color: Colors.grey, child: OrdersWidget())
          ],
        ),
      ),
    );
  }
}
