import 'dart:io';

class APINetworkConstants {
  static const baseURL = "https://api.mocklets.com/";

  static const Map<String, String> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json"
  };
}
