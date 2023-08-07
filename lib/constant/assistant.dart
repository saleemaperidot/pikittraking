import 'package:geolocator/geolocator.dart';
import 'package:pikittraking/Model/directions.dart';
import 'package:pikittraking/constant/request_assistance.dart';

class Assistant {
  static Future<String> getAddressfromtheLocation(
      Position position, context) async {
    String ApiUrl =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=44.4647452,7.3553838&key=AIzaSyAJ9uDjumJRJxLPjVc73MVyDzJRZWvUnfc";
    String humanReadableAddress = "";
    var requestResponse = await RequestAssistant.receiveRequest(ApiUrl);
    print("requestResponse$requestResponse");
    if (requestResponse != "Error") {
      humanReadableAddress = requestResponse['results'][0]['fomatted-address'];

      Directions userPickerDirection = Directions(
          "", humanReadableAddress, "", position.latitude, position.longitude);
    } else {}

    return humanReadableAddress;
  }
}
