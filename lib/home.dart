import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pikittraking/Presentation/pages/accepted.dart';
import 'package:pikittraking/Presentation/pages/account.dart';
import 'package:pikittraking/Presentation/pages/new_orders.dart';
import 'package:pikittraking/Presentation/pages/pickedup.dart';
import 'package:pikittraking/Presentation/widgets/custom_bottom_navigation.dart';
import 'package:pikittraking/controllers/orderlistController.dart';

class Home extends StatelessWidget {
  Home({super.key});
//  PickedListController pickedListController = Get.put(PickedListController());
  final Pages = [NewOrders(), Accepted(), PickedUp(), Account()];

  @override
  Widget build(BuildContext context) {
    Get.put(OrderListController());
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageNotifier,
        builder: (context, value, _) {
          return SafeArea(
            child: Pages[value],
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
