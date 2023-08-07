import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pikittraking/Model/accepted_order_model/accepted_order.dart';
import 'package:pikittraking/Presentation/pages/pickedup.dart';
import 'package:pikittraking/constant/datediff.dart';
import 'package:pikittraking/controllers/deliver_order_controller.dart';
import 'package:pikittraking/controllers/orderlistController.dart';
import 'package:pikittraking/controllers/picked_list_controller.dart';
import 'package:pikittraking/controllers/pickedup_controller.dart';
import 'package:pikittraking/controllers/single_order_controller.dart';

class SinglePickedScreen extends StatelessWidget {
  SinglePickedScreen({
    super.key,
  });

  final PickedUPController _singlePickedUpController =
      Get.find<PickedUPController>();
  final DeliverOrderController _deliveredOrderController =
      Get.put(DeliverOrderController());

  @override
  Widget build(BuildContext context) {
    // _singleOrderController.orderid = orderId;
    _singlePickedUpController.getSingleOrder();
    final order = _singlePickedUpController.pickedup;
    print("single order picked Presentation$order");
    final a = order.value.uniqueOrderId!.split('-');
    final time = DateTime.parse(order.value.updatedAt!);
    final currentTime = DateTime.now();
    var diff = getTimeDifference(time);
    final orderid = order.value.uniqueOrderId!;
    print("order id on single screen order picked$orderid");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        // iconTheme: IconThemeData(color: Colors.white),
        title: Text("ORDER ID"),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => _singlePickedUpController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Card(
                      color: Colors.black.withOpacity(0.003),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("commission:"),
                                Text(
                                    // "",

                                    order.value.restaurant!.commissionRate
                                        .toString())
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "TOTAL EARNINGS",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  //"",
                                  (order.value.restaurant!.commissionRate ??
                                      ""),
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        color: Colors.black.withOpacity(0.1),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.watch_rounded),
                              title: Text("item ordered ${diff} "),
                            ),
                            Stack(children: [
                              OrderDetails(),
                              Positioned(
                                top: 10,
                                left: 45,
                                // alignment: Alignment(15, 10),
                                child: Container(
                                  width: 1,
                                  height: 250,
                                  color: Colors.grey,
                                ),
                              )
                            ])
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    itemDetails(),
                    Container(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green)),
                          onPressed: () async {
                            // _deliveredOrderController.orderId =
                            //     order.value.id!;
                            print("order.value.id!${order.value.id!}");
                            final response =
                                await _deliveredOrderController.DeliverOrder(
                                    order.value.id!);
                            if (response == false ||
                                _deliveredOrderController.isLoading == true) {
                              Get.snackbar("Loading", "Loading");
                            } else {
                              final pickedListController =
                                  Get.find<PickedListController>();

                              await pickedListController.OrderList();
                              Get.off(() => PickedUp());
                            }
                            // PickedUPController _pick = Get.put(PickedUPController());
                            // _pick.orderid = orderid;
                            // Get.to(() => PickedUp());
                          },
                          child: Text("Delivered")),
                    )
                  ],
                ),
        ),
      )),
    );
  }

  Widget OrderDetails() {
    final order = Get.find<PickedUPController>();
    final singleorder = order.pickedup.value;

    return Container(
      child: Card(
        color: Colors.black.withOpacity(0.003),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.shopping_bag),
                      SizedBox(
                        width: 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // "",
                            singleorder.restaurant!.name
                                .toString()
                                .toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 250,
                            child: Text(
                                overflow: TextOverflow.ellipsis,
                                //"",
                                "${singleorder.restaurant!.address},\n${singleorder.restaurant!.landmark},${singleorder.restaurant!.pincode}"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.directions,
                            ),
                            label: Text("Direction"),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            //  "",
                            singleorder.user!.name ?? "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              //  "",
                              singleorder.user!.phone!),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.directions,
                            ),
                            label: Text("Direction"),
                          ),
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemDetails() {
    final order = Get.find<PickedUPController>();
    final singleorder = order.pickedup.value;

    return Card(
      color: Colors.black.withOpacity(0.003),
      child: Container(
        child: Column(
          children: [
            Container(
              color: Colors.black.withOpacity(0.01),
              child: ListTile(
                leading: Icon(Icons.list_outlined),
                title: Text("Ordered items"),
              ),
            ),
            Card(
              color: Colors.black.withOpacity(0.003),
              child: Container(
                height: 100,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: singleorder.orderitems!.length,
                  itemBuilder: (context, index) {
                    final item = singleorder.orderitems![index];
                    return ListTile(
                      leading: Text(
                          //"",
                          ("${item.quantity}x").toString()),
                      title: Text(item.name ?? ""),
                      trailing: Text(item.price ?? ""),
                    );
                  },
                ),
              ),
            ),
            Divider(
              indent: 4,
              height: 5,
            ),
            Card(
              color: Colors.black.withOpacity(0.003),
              child: ListTile(
                trailing: Text(
                  singleorder.payable!.toString(),
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class itemDiscription extends StatelessWidget {
  const itemDiscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
