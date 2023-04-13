import 'package:askun_delivery_app/Models/login/login.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'optscreen/otpscreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileNumberController = TextEditingController();
  // String hardcodedMobileNumber = "6369739624";
  final _formKey = GlobalKey<FormState>();
  late LoginResponse loginResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(12.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SmallText(
      //         text: 'Don\'t have an Account?',
      //         size: 16,
      //         color: blueGrey,
      //       ),
      //       const SizedBox(
      //         width: 5,
      //       ),
      //       InkWell(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 PageTransition(
      //                     type: PageTransitionType.rightToLeft,
      //                     child: const RegisterPage()));
      //           },
      //           child: SmallText(
      //             text: 'Register',
      //             fontWeight: FontWeight.w500,
      //           )),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 100, 15, 50),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/logo.png',
                            height: 150,
                            width: 150,
                          ),
                        ),
                        // heightSpace,
                        Center(
                          child: SmallText(
                            text: MyStrings.login,
                            size: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        heightSpace,
                        heightSpace,
                        // heightSpace,
                        // heightSpace,
                        // heightSpace,
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: MyStrings.loginMessage,
                            style: TextStyle(
                              fontSize: 15,
                              color: blueGrey,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: MyStrings.oTP,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: primaryColor)),
                              const TextSpan(text: MyStrings.mobile),
                            ],
                          ),
                        ),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Container(
                      // height: MediaQuery.of(context).size.height/5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(text: MyStrings.mobileNumber),
                          heightSpace,
                          TextField(
                            cursorColor: primaryColor,
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^1+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^2+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^3+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^4+')),
                              FilteringTextInputFormatter.deny(RegExp(r'^5+')),
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              hoverColor: primaryColor,
                              focusColor: primaryColor,
                              isDense: true,
                              counterText: "",
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 12, 10, 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(width: 1, color: blueGrey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5.0)),
                                borderSide:
                                    BorderSide(width: 1, color: blueGrey),
                              ),
                              suffixIcon: Icon(
                                Icons.phone_android_sharp,
                                size: 25,
                                color: primaryColor,
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(top: 14.0),
                                child: Text(
                                  '+91',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                if (_mobileNumberController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Please enter the registered mobile number')),
                                  );
                                } else if (_mobileNumberController.text.length <
                                    10) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please enter a valid mobile number')),
                                  );
                                }
                               else{ _login(_mobileNumberController.text);}
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: SmallText(
                                    text: MyStrings.sendOTP,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w500,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // Center(
                    //     child: SmallText(
                    //   text: MyStrings.dummyMessage,
                    //   color: blueGrey,
                    //   fontStyle: FontStyle.italic,
                    //   fontWeight: FontWeight.w400,
                    // ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _login( String mobilenumber) async {
    // LoaderScreen();
    // networkStatus().then((isReachable) {
    // if (isReachable!) {
    //  startLoader();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  SpinKitFadingCircle(
          color: primaryColor,
        );
      },
    );
    Webservice()
        .callLoginService(phoneNumber: mobilenumber)
        .then((onResponse) async {
          stopLoader();
     if(onResponse!.message=="OTP has been sent to your phone number"||onResponse.message=="New User registered, OTP sent to your Mobile Number" ){
       print(onResponse);
       print("SUCCESS");
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString("loginResponse", mobilenumber);
       if(onResponse.message == "OTP has been sent to your phone number"){
         Fluttertoast.showToast(msg: "Otp send to your register Mobile number");
       }
       else {
         Fluttertoast.showToast(msg: "Otp send to your register Mobile number");
       }

         await Future.delayed(const Duration(seconds: 2));
         Navigator.push(
             context,
             PageTransition(
                 type: PageTransitionType.rightToLeft, child:  OTPScreen()));
       }
     else{
       Fluttertoast.showToast(msg: "Failed to login");

    }

    }).catchError((error) async {
     // if (error.toString().contains('User does not exist')) {
     //    Fluttertoast.showToast(msg: 'User does not exist');
     //    await Future.delayed(const Duration(seconds: 2));
     //    Navigator.push(
     //        context,
     //        PageTransition(
     //            type: PageTransitionType.rightToLeft, child: const RegisterPage()));
     //  }
     //  else {
     //    Fluttertoast.showToast(msg: 'Failed to login');
     //  }
     //  print(error);
    });
  }

  stopLoader() {
    Navigator.of(context).pop();
  }
}
