import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class Service {
  static const String HTTP_GET = "HTTP_GET";
  static const String HTTP_POST = "HTTP_POST";
  static const String HTTP_PUT = "HTTP_PUT";
  static const String HTTP_PATCH = "HTTP_PATCH";
  static const String HTTP_DELETE = "HTTP_DELETE";

  String serverErrorMessage = "";
  String exceptionMessage = "";

  int timeout = 14;

  Service() {}

  Map<String, String> headers = new HashMap<String, String>();

  Future<http.Response?> request(String url, String method,
      {dynamic body}) async {
    http.Response? response;

    try {
      switch (method) {

        case HTTP_GET:
          response = await http
              .get(Uri.parse(url), headers: this.headers)
              .timeout(new Duration(seconds: timeout));
          break;

        case HTTP_POST:
          response = await http
              .post(Uri.parse(url),
              body: body != null ? json.encode(body) : {},
              headers: this.headers)
              .timeout(new Duration(seconds: timeout));
          break;

        case HTTP_PUT:
          response = await http
              .put(Uri.parse(url),
              body: body != null ? json.encode(body) : json.encode({}),
              headers: this.headers)
              .timeout(new Duration(seconds: timeout));
          break;

        case HTTP_PATCH:
          response = await http
              .patch(Uri.parse(url),
              body: body != null ? json.encode(body) : {},
              headers: this.headers)
              .timeout(new Duration(seconds: timeout));
          break;

        case HTTP_DELETE:
          response = await http
              .delete(Uri.parse(url), headers: this.headers)
              .timeout(new Duration(seconds: timeout));
          break;
      }

      if (response != null) {
        if (response.statusCode == 401) {
          return await request(url, method, body: body);
        }
      }

      return response;
    } catch (e) {
      exceptionMessage = e.toString();
      return null;
    }
  }
}