import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestAssistant {
  static Future<dynamic> receiveRequest(String Url) async {
    http.Response httpResponse = await http.get(Uri.parse(Url));
    try {
      if (httpResponse.statusCode == 200 || httpResponse.statusCode == 201) {
        String responseData = httpResponse.body;
        var decoderesponse = jsonDecode(responseData);
        return decoderesponse;
      } else {
        return "Error";
      }
    } catch (e) {
      return "Error";
    }
  }
}
