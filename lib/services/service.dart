import 'dart:convert';
import 'package:askun_delivery_app/Models/login/login.dart';
import 'package:askun_delivery_app/Models/login/otp/otpmodel.dart';
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

// Register Service

  // Future<RegisterResponse> callRegisterService(
  //     {required String username, required String mobilenumber}) async {
  //   var url = Uri.parse(ApiConstants.registerURL);
  //   print(url);
  //   Map data = {
  //     'username': username,
  //     'phone_number': mobilenumber,
  //   };
  //   //encode Map to JSON
  //   var body = json.encode(data);
  //   print(body);
  //   Map<String, String> headers = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //   };
  //   final response = await http.post(url, headers: headers, body: body).timeout(
  //     Duration(seconds: timeDuration),
  //     onTimeout: () {
  //       // Time has run out, do what you wanted to do.
  //       return http.Response('Error', 400);
  //     },
  //   );
  //   print(response.statusCode);
  //   print(response.body);
  //
  //   if (response.statusCode == 201) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString("registerResponse",response.body.toString());
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     Map<String, dynamic> jsonResponse = json.decode(response.body);
  //     if (jsonResponse['status'] == 'success') {
  //       return RegisterResponse.fromJson(jsonResponse);
  //     } else {
  //       throw Exception(jsonResponse['message']);
  //     }
  //   }
  //   else if (response.statusCode == 500) {
  //     throw Exception('User already exists');
  //   }
  //   else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }


// Login Service
  Future<LoginResponse?> callLoginService({required String phoneNumber}) async {
    var url = Uri.parse(ApiConstants.loginURL);
    print("URL: $url");
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    Map<String, dynamic> data = {
      'phone_number': phoneNumber,
    };
    //encode Map to JSON
    var body = json.encode(data);
    print("Request body: $body");

    final response = await http.post(url, headers: headers, body: body).timeout(
      Duration(seconds: timeDuration),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response('Error', 400);
      },
    );
    print("Response status code: ${response.statusCode}");
    print("Response body: ${response.body}");
    //
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> jsonResponse = json.decode(response.body);
    //   print(jsonResponse);
    //   if (jsonResponse['status'] == 'OTP has been sent to your phone number') {
    //     final message = jsonResponse['message'];
    //     if (message == 'OTP has been sent to your phone number') {
    //       // OTP has been sent, return null to indicate success without a response
    //       return  LoginResponse.fromJson(jsonResponse);
    //     } else {
    //       final loginResponse = LoginResponse.fromJson(jsonResponse);
    //       SharedPreferences prefs = await SharedPreferences.getInstance();
    //       prefs.setString("loginResponse", json.encode(loginResponse.toJson()));
    //       return loginResponse;
    //     }
    //   } else {
    //     throw Exception(jsonResponse['message']);
    //   }
    // }

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("loginResponse",response.body.toString());
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['message'] == 'OTP has been sent to your phone number') {
        return LoginResponse.fromJson(jsonResponse);
      }
      else if (jsonResponse['message'] == 'New User registered, OTP sent to your Mobile Number') {
        return LoginResponse.fromJson(jsonResponse);
      }

      else {
        throw Exception(jsonResponse['message']);
      }
    }

    else if (response.statusCode == 404) {
      throw Exception('User does not exist');
    }else if (response.statusCode == 500) {
      throw Exception('OTP already sent recently, please wait for some time before trying again');
    }
    else {
      throw Exception('Failed to login');
    }
  }

  // Verify OTP Service
  Future<VerifyOtp?> callVerifyOtpService({required String otpCode }) async {
    var url = Uri.parse(ApiConstants.loginURL);
    print("URL: $url");
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    Map<String, dynamic> data = {
      "otp":otpCode
    };
    print(otpCode);
    //encode Map to JSON
    var body = json.encode(data);
    print("Request body: $body");

    final response = await http.put(url, headers: headers, body: body).timeout(
      Duration(seconds: timeDuration),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response('Error', 400);
      },
    );
    print("Response status code: ${response.statusCode}");
    print("Response body: ${response.body}");
    //
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> jsonResponse = json.decode(response.body);
    //   print(jsonResponse);
    //   if (jsonResponse['status'] == 'OTP has been sent to your phone number') {
    //     final message = jsonResponse['message'];
    //     if (message == 'OTP has been sent to your phone number') {
    //       // OTP has been sent, return null to indicate success without a response
    //       return  LoginResponse.fromJson(jsonResponse);
    //     } else {
    //       final loginResponse = LoginResponse.fromJson(jsonResponse);
    //       SharedPreferences prefs = await SharedPreferences.getInstance();
    //       prefs.setString("loginResponse", json.encode(loginResponse.toJson()));
    //       return loginResponse;
    //     }
    //   } else {
    //     throw Exception(jsonResponse['message']);
    //   }
    // }

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("otpVerifyResponse",response.body.toString());
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Map<String, dynamic> jsonResponse = json.decode(response.body);
    //  if (jsonResponse['message'] == 'OTP has been sent to your phone number') {
        return VerifyOtp.fromJson(jsonResponse);
     // } else {
        throw Exception(jsonResponse['message']);
     // }
    }

    else if (response.statusCode == 404) {
      throw Exception('User does not exist');
    }else if (response.statusCode == 500) {
      throw Exception('OTP already sent recently, please wait for some time before trying again');
    }
    else {
      throw Exception('Failed to login');
    }
  }
}
