import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pikittraking/constant/constant.dart';

ValueNotifier<int> pageNotifier = ValueNotifier(0);

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageNotifier,
        builder: (context, int value, _) {
          return BottomNavigationBar(
            onTap: (index) {
              pageNotifier.value = index;
            },
            currentIndex: value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(pikitnewOrders), label: " New Orders"),
              BottomNavigationBarItem(
                  icon: Icon(pikitAccepted), label: " Accepted"),
              BottomNavigationBarItem(
                  icon: Icon(pikipickedUp), label: " Picked up"),
              BottomNavigationBarItem(
                  icon: Icon(pikitaccount), label: " Account"),
            ],
          );
        });
  }
}
