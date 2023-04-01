import 'dart:convert';
import 'package:askun_delivery_app/Models/register/register.dart';
import 'package:askun_delivery_app/utilites/api_constant.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({required this.url, required this.parse});
}

class Webservice {

  // Future<RegisterResponse> callRegisterService(
  //     {required String username, required String mobilenumber}) async {
  //   var url = Uri.parse(ApiConstants.registerURL);
  //   Map data = {
  //     'emp_id': username,
  //     'password': mobilenumber,
  //   };
  //   //encode Map to JSON
  //   var body = json.encode(data);
  //   Map<String, String> headers = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //   };
  //   final response = await http.post(url, headers: headers, body: body).timeout(
  //     Duration(seconds: timeDuration),
  //     onTimeout: () {
  //       // Time has run out, do what you wanted to do.
  //       return http.Response('Error', 500);
  //     },
  //   );
  //   print(response.statusCode);
  //   print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString("loginResponse",response.body.toString());
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return RegisterResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  Future<RegisterResponse> callRegisterService(
      {required String username, required String mobilenumber}) async {
    var url = Uri.parse(ApiConstants.registerURL);
    Map data = {
      'emp_id': username,
      'password': mobilenumber,
    };
    //encode Map to JSON
    var body = json.encode(data);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.post(url, headers: headers, body: body).timeout(
      Duration(seconds: timeDuration),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response('Error', 500);
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("loginResponse",response.body.toString());
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 'success') {
        return RegisterResponse.fromJson(jsonResponse);
      } else {
        throw Exception(jsonResponse['message']);
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}
