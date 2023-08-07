import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pikittraking/Model/user_info/order.dart';

import 'package:pikittraking/constant/constant.dart';
import 'package:pikittraking/constant/datediff.dart';
import 'package:pikittraking/controllers/update_user_controller.dart';

class OrdersWidget extends StatelessWidget {
  OrdersWidget({super.key});
  UpdateUserController userController = Get.find<UpdateUserController>();

  @override
  Widget build(BuildContext context) {
    final user = userController.userData;

    return Expanded(
        child: Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          final order = user.value.data!.orders![index];
          String updatedDate = user.value.data!.orders![index].updatedAt!;

          DateTime tempDate =
              new DateFormat("yyyy-MM-dd hh:mm:ss").parse(updatedDate);
          String timeDifference = getTimeDifference(tempDate);
          return Orderwidget(order);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 5,
          );
        },
        itemCount: user.value.data!.orders!.length,
      ),
    ));
  }

  Widget Orderwidget(Order order) {
    String updatedDate = order.updatedAt!;
    DateTime tempDate =
        new DateFormat("yyyy-MM-dd hh:mm:ss").parse(updatedDate);
    String timeDifference = getTimeDifference(tempDate);
    return Padding(
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 170,
          color: Colors.blueGrey.shade400,
          child: Column(
            children: [
              ListTile(
                leading: Text(
                  "#${order.order!.uniqueOrderId.toString().substring(15, 23)}",
                  style: txtStyle,
                ),
                trailing: Text(
                  "$timeDifference ",
                  style: txtStyle,
                ),
              ),
              ListTile(
                trailing: ButtonTheme(
                  //buttonColor: Colors.orange,
                  minWidth: 200,
                  height: 70,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      onPressed: () {},
                      child: Text(order.order!.paymentMode == "COD"
                          ? "Cash On Delivery ${order.order!.payable}"
                          : "Online")),
                ),
                leading: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 231, 146, 19))),
                  child: Text(order.isComplete == 1 ? "completed" : "on going"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(
                      order.order!.address!,
                      // "Tavalam parambil house,kodaloor road,sankaramangalam,pattambi,R5",
                      style: txtStyle,
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
