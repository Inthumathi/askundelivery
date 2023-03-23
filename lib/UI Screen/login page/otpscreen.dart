
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utilites/constant.dart';
import '../../utilites/strings.dart';
import '../../widget/smalltext.dart';
import '../buttom_navigation.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  String hardCode =  "1234";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffffd6c2)),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: primaryColor,
                  size: 30,
                )),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 150,
                  width: 150,
                ),
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              SmallText(
                text: MyStrings.verificationMessage,
                fontWeight: FontWeight.w500,
                color: blueGrey,
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              SmallText(
                text: MyStrings.enterOTP.toUpperCase(),
                fontWeight: FontWeight.w500,
              ),
              heightSpace,
              Form(
                key: formKey,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField (
                      appContext: context,
                      inputFormatters: [
                        // WhitelistingTextInputFormatter.digitsOnly
                      ],
                      cursorHeight: 20,
                      // pastedTextStyle: TextStyle(
                      //   // color: Colors.green.shade600,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      length: 4,
                      // obscureText: true,
                      // obscuringCharacter: '*',
                      // obscuringWidget: const FlutterLogo(
                      //   size: 24,
                      // ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      // validator: (v) {
                      //   if (v!.length < 3) {
                      //     return "I'm from validator";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        fieldHeight: 75,
                        fieldWidth: 60,
                        // borderRadius: BorderRadius.circular(5),
                        // errorBorderColor:  Color(0xffC4C5C4),
                        selectedColor: Color(0xffd8d8d8),
                        inactiveColor: Color(0xffC4C5C4),
                        borderWidth: 1,
                        activeColor: Color(0xffffdecd),
                        disabledColor: whiteColor,
                        selectedFillColor: Color(0xffffd8c5),
                        inactiveFillColor: Color(0xffd8d8d8),
                        // fieldHeight: 50,
                        // fieldWidth: 40,
                        activeFillColor: Color(0xffd8d8d8),
                      ),
                      cursorColor: Colors.black.withOpacity(0.8),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      // errorAnimationController: errorController,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      // boxShadows: const [
                      //   BoxShadow(
                      //     offset: Offset(0, 1),
                      //     color: Colors.black12,
                      //     blurRadius: 10,
                      //   )
                      // ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },

                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    )),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    if(otpController.text == hardCode){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: BottomNavigation()));
                    }else{
                      Fluttertoast.showToast(msg:"Enter valid otp");

                    }
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
                        text: MyStrings.submit,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        size: 16,
                      ),
                    ),

                  ),


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
