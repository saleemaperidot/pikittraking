import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pikittraking/Apis/ApiEndPoints.dart';
import 'package:pikittraking/Model/user_info/driverlocation.dart';
import 'package:pikittraking/constant/assistant.dart';

class MapScreen extends StatefulWidget {
  MapScreen(
      {super.key, required this.currentposition, required this.destination});
  final Position currentposition;
  final LatLng destination;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? pickLocation;
  //loc.Location location = loc.Location();
  String? address;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  GoogleMapController? newGoogleMapController;
  @override
  // TODO: implement widget

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  double searchLocationContaineerHeight = 220;
  double waitingResponseFromDriverContainerHeight = 0;
  double assignedDriverContainerHeight = 0;

  Position? userCurruntPosition;
  var geoLocator = Geolocator();

  LocationPermission? _locationpermission;

  double? bottomPaddingofMap;

  List<LatLng> pLineCoardinatedList = [];
  Set<Polyline> polylineSet = {};

  Set<Marker> markerSet = {};
  Set<Circle> circleSet = {};

  String? username;
  String? userEmail;

  bool openNavigationDrawer = true;

  bool activeNearByDriverKeysLoaded = false;

  //LatLng? source;

  BitmapDescriptor? activeNearByIcon;
  CameraPosition? driver;

  late LatLng source;
  late LatLng destination;

  loc.LocationData? currentLocation;
  void getCurrentLocation() async {
    widget.currentposition;
    widget.destination;
    source = LatLng(
        widget.currentposition.latitude, widget.currentposition.longitude);
    destination = widget.destination;
    //  source = LatLng(10.9990, 75.9918);
    //  destination = LatLng(10.8057, 76.1957);
    loc.Location location = loc.Location();

    location.getLocation().then(
      (loccation) {
        currentLocation = loccation;
      },
    );

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13.5,
            target: LatLng(
              newLoc.latitude!,
              newLoc.longitude!,
            ),
          ),
        ),
      );
      setState(() {});
    });
  }

  List<LatLng> polylinecordinates = [];
  getpoylinePoint() async {
    PolylinePoints polylinePoints = PolylinePoints();
    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          ApiEndPoints.MAP_KEY,
          PointLatLng(source.latitude, source.longitude),
          // PointLatLng(currentLocation!.latitude, destination.longitude),
          PointLatLng(destination.latitude, destination.longitude));

      if (result.points.isNotEmpty) {
        print("polyline result$result");
        result.points.forEach((PointLatLng points) {
          print(points);
          polylinecordinates.add(LatLng(points.latitude, points.longitude));
        });
        setState(() {});
      }
    } catch (e) {
      print("e$e");
    }
  }

  locateUserPosition() async {
    _locationpermission = await Geolocator.requestPermission();
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print("cposition$cPosition");
    userCurruntPosition = cPosition;
    // print(" DriverLoc$widget.position");
    LatLng latLangPosition =
        LatLng(userCurruntPosition!.latitude, userCurruntPosition!.longitude);
    source = latLangPosition;

    //CameraPosition cameraPosition =
    driver = CameraPosition(target: latLangPosition, zoom: 15);
    //  final GoogleMapController controller = await _controller.future;
    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(driver!));

    String userReadbaleAddress = await Assistant.getAddressfromtheLocation(
        userCurruntPosition!, context);

    print("this is current position" + userReadbaleAddress);
  }

  getAddressFromLatlang() async {
    try {
      GeoData data = await Geocoder2.getDataFromCoordinates(
        latitude: currentLocation!.latitude!,
        longitude: currentLocation!.longitude!,
        googleMapApiKey: ApiEndPoints.MAP_KEY,
      );
      setState(() {
        address = data.address;
        print("address$address");
      });
    } catch (e) {
      print("adreess exeption$e");
    }
  }

  checkiflocattionpermissionallowed() async {
    _locationpermission = await Geolocator.requestPermission();
    if (_locationpermission == LocationPermission.denied) {}
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
    checkiflocattionpermissionallowed();
    getCurrentLocation();
    getpoylinePoint();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            currentLocation == null
                ? const Center(child: Text("Loading"))
                : GoogleMap(
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: true,
                    polylines: {
                      Polyline(
                          polylineId: PolylineId("route"),
                          points: polylinecordinates,
                          color: Colors.green,
                          width: 6),
                    },
                    markers: {
                      Marker(markerId: MarkerId("source"), position: source),
                      Marker(
                          markerId: MarkerId("destination"),
                          position: destination),
                      Marker(
                          markerId: MarkerId("currentlocation"),
                          position: LatLng(currentLocation!.latitude!,
                              currentLocation!.longitude!)),
                    },
                    initialCameraPosition: CameraPosition(
                        target: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                        zoom: 13.5),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      // googleMapController = controller;
                      setState(() {});
                      // locateUserPosition();
                    },
                    onCameraIdle: () {
                      getAddressFromLatlang();
                    },
                    // onCameraMove: (CameraPosition position) {
                    //   if (pickLocation != position.target) {
                    //     setState(() {
                    //       //  pickLocation = position.target;
                    //     });
                    //   }
                    // },
                  ),
            Positioned(
                top: 40,
                right: 20,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white),
                  padding: const EdgeInsets.all(20),
                  child: Text(address ?? "set your pickup locator"),
                ))
          ],
        ),
      ),
    );
  }
}
