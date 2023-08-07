import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pikittraking/Model/user_info/user_info.dart';
import 'package:pikittraking/controllers/update_user_controller.dart';

class EarningsWidget extends StatelessWidget {
  EarningsWidget({super.key});
  UpdateUserController userInfo = Get.find<UpdateUserController>();

  @override
  Widget build(BuildContext context) {
    final user = userInfo.userData;
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey,
      child: Obx(
        () => GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4),
          children: [
            Container(
              height: 50,
              color: Colors.blueGrey,
              child: Center(
                  child: Text(
                      "Rs ${user.value.data!.earnings![1].amount} \n EARNINGS")),
            ),
            Container(
              height: 50,
              color: Colors.blueGrey,
              child: Center(
                  child: Text(
                      "Rs ${user.value.data!.totalEarnings!} \n Total earnings")),
            ),
            Container(
              height: 50,
              color: Colors.orange,
              child: Center(
                  child:
                      Text("Rs ${user.value.data!.onGoingCount} \n on-going")),
            ),
            Container(
              height: 50,
              color: Colors.green,
              child: Center(
                  child: Text(
                      "Rs ${user.value.data!.completedCount} \n COMPLETED")),
            )
          ],
        ),
      ),
    );
  }
}
