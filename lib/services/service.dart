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


  Future<RegisterResponse> callRegisterService(
      {required String username, required String mobilenumber}) async {
    var url = Uri.parse(ApiConstants.registerURL);
    print(url);
    Map data = {
      'username': username,
      'phone_number': mobilenumber,
    };
    //encode Map to JSON
    var body = json.encode(data);
    print(body);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.post(url, headers: headers, body: body).timeout(
      Duration(seconds: timeDuration),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response('Error', 400);
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("registerResponse",response.body.toString());
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 'success') {
        return RegisterResponse.fromJson(jsonResponse);
      } else {
        throw Exception(jsonResponse['message']);
      }
    }
    else if (response.statusCode == 500) {
      throw Exception('User already exists');
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
