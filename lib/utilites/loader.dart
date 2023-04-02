
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingDialog {
  static showLoaderDialog(BuildContext context, String popUpMsg) {
    showDialog(

      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return SvgPicture.asset(
          'assets/loader.svg',
          color: Colors.red,
          height: 25,
          width: 25,
        );
        //   const SizedBox(
        //   width: 25,
        //   height: 25,
        //   child: Image(
        //     image: AssetImage('assets/loader.gif',),width: 10,height: 10,
        //   ),
        // );
},
    );
  }
}