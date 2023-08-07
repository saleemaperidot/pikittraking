import 'dart:convert';
import 'dart:ffi';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pikittraking/Model/accepted_order_model/accepted_order.dart';
import 'package:pikittraking/Model/user_info/driverlocation.dart';
import 'package:pikittraking/Presentation/Screens/map_screen.dart';
import 'package:pikittraking/Presentation/Screens/single_picked_order.dart';
import 'package:pikittraking/Presentation/pages/pickedup.dart';
import 'package:pikittraking/constant/datediff.dart';
import 'package:pikittraking/controllers/orderlistController.dart';
import 'package:pikittraking/controllers/pickedup_controller.dart';
import 'package:pikittraking/controllers/single_order_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SinglrOrderScreen extends StatelessWidget {
  SinglrOrderScreen({
    super.key,
  });

  final SingleOrderController _singleOrderController =
      Get.find<SingleOrderController>();
  PickedUPController pick = Get.put(PickedUPController());
  @override
  Widget build(BuildContext context) {
    // _singleOrderController.orderid = orderId;
    final order = _singleOrderController.singleOrder;
    print("single orderPresentation$order");
    order.value.updatedAt ?? "";
    final time = DateTime.parse(order.value.updatedAt!);
    final currentTime = DateTime.now();
    var diff = getTimeDifference(time);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        // iconTheme: IconThemeData(color: Colors.white),
        title:
            Text("#${order.value.uniqueOrderId!.toString().substring(15, 23)}"),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => _singleOrderController.isLoading.value
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
                                Text(order.value.restaurant!.commissionRate
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
                              title: Text("item ordered ${diff}"),
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
                            print(" pick.orderid${order.value.id!}}");

                            pick.orderid = order.value.id!;
                            await pick.getSingleOrder();

                            //  Get.find<OrderListController>().refresh();
                            Get.to(() => SinglePickedScreen());
                          },
                          child: Text("Take Order")),
                    )
                  ],
                ),
        ),
      )),
    );
  }

  Widget OrderDetails() {
    final order = Get.find<SingleOrderController>();
    final singleorder = order.singleOrder.value;

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
                                "${singleorder.restaurant!.address},\n${singleorder.restaurant!.landmark},${singleorder.restaurant!.pincode}"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              double latitude = double.parse(
                                  singleorder.restaurant!.latitude!);
                              double logitude = double.parse(
                                  singleorder.restaurant!.longitude!);
                              LatLng latLng = LatLng(latitude, logitude);
                              Position position =
                                  await Geolocator.getCurrentPosition(
                                      desiredAccuracy: LocationAccuracy.high,
                                      forceAndroidLocationManager: true);
                              // DriverLoc(position: position);
                              print(position);
                              Get.to(MapScreen(
                                  currentposition: position,
                                  destination: latLng));
                            },
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
                            singleorder.user!.name ?? "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(singleorder.user!.phone!),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              String address = singleorder.address!;
                              final decordedResult = jsonDecode(address);
                              print(decordedResult);
                              double latitude =
                                  double.parse(singleorder.address!);
                              double logitude = double.parse(
                                  singleorder.restaurant!.longitude!);
                              LatLng latLng = LatLng(latitude, logitude);
                              Position position =
                                  await Geolocator.getCurrentPosition(
                                      desiredAccuracy: LocationAccuracy.high,
                                      forceAndroidLocationManager: true);
                              // DriverLoc(position: position);
                              print(position);
                              Get.to(MapScreen(
                                  currentposition: position,
                                  destination: latLng));
                            },
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
    final order = Get.find<SingleOrderController>();
    final singleorder = order.singleOrder.value;

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
                      leading: Text(("${item.quantity}x").toString()),
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
