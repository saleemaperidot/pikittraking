import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pikittraking/Presentation/Screens/single_order.dart';
import 'package:pikittraking/constant/constant.dart';
import 'package:pikittraking/controllers/orderlistController.dart';
import 'package:pikittraking/controllers/single_order_controller.dart';
import 'package:pikittraking/controllers/single_order_controller.dart';
import 'package:pikittraking/controllers/single_order_controller.dart';

class NewOrders extends StatelessWidget {
  NewOrders({super.key});
  // OrderListController orderListController = Get.put(OrderListController());
  OrderListController orderListController = Get.put(OrderListController());
  SingleOrderController singleOrderController =
      Get.put(SingleOrderController());
  @override
  Widget build(BuildContext context) {
    orderListController.OrderList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("ORDER NAME"),
        actions: [
          TextButton.icon(
            onPressed: () {
              orderListController.OrderList();
            },
            label: Text("Refresh"),
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      // backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(1),
            child: GetX<OrderListController>(
                builder: (OrderListController orderListController) {
              return orderListController.isLosding.value == true
                  ? CircularProgressIndicator()
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        final singleorder =
                            orderListController.acceptedOrders[index];
                        print(singleorder);
                        final userId = singleorder.uniqueOrderId!;
                        final a = singleorder.uniqueOrderId!.split('-');
                        final time = DateTime.parse(singleorder.updatedAt!);
                        final currentTime = DateTime.now();
                        var diff = currentTime.difference(time);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              singleOrderController.orderid =
                                  singleorder.uniqueOrderId!;
                              await singleOrderController.getSingleOrder();
                              print(singleorder.uniqueOrderId);
                              Get.to(
                                () => SinglrOrderScreen(),
                              );
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          //"3 minutes ago"
                                          "   ${diff.toString()} minutes ago",
                                        ),
                                        Text(
                                          // "22",
                                          singleorder
                                              .restaurant!.commissionRate!
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 30, 213, 36)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            // "name",
                                            singleorder.restaurant!.name!
                                                .toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.purple,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17),
                                          ),
                                          Text(
                                            // "id"
                                            a[4],
                                            //    style: TextStyle(color: Colors.grey),
                                          ),
                                        ]),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined),
                                        Text(
                                          //  "D2D TOTAL ,perithalmanna ,pattambi road,ongaloor,near muslim masjid",
                                          singleorder.address!,
                                          style: TextStyle(
                                              // color: Colors.grey,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 1,
                        );
                      },
                      itemCount: orderListController.acceptedOrders.length,
                    );
            })),
      ),
    );
  }
}
