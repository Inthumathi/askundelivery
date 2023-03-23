
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';

class serachPage extends StatefulWidget {
  const serachPage({Key? key}) : super(key: key);

  @override
  State<serachPage> createState() => _serachPageState();
}

class _serachPageState extends State<serachPage> {
  final TextEditingController _controller = new TextEditingController();
  bool _wasEmpty = true;

  @override
  void initState() {
    super.initState();
    // _controller = TextEditingController(text: widget.initialValue);
    _wasEmpty = _controller.text.isEmpty;
    _controller.addListener(() {
      if (_wasEmpty != _controller.text.isEmpty) {
        setState(() => {_wasEmpty = _controller.text.isEmpty});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          title:  SmallText(text: MyStrings.searchProduct,fontWeight: FontWeight.bold,size: 20),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child:Container(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                child: TextField(
                  cursorColor: primaryColor,
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    hoverColor: primaryColor,
                    focusColor: primaryColor,
                    fillColor: whiteColor,
                    isDense: true, // important line
                    contentPadding: EdgeInsets.fromLTRB(10, 12, 10, 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 1,color: blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(width: 1,color: blueGrey),
                    ),
                    hintText: "Search your product here... ",
                    hintStyle: TextStyle(fontSize: 18,color: blueGrey,fontWeight: FontWeight.bold),
                    suffixIcon:_wasEmpty == true? IconButton(onPressed: (){},icon: Icon(Icons.mic,size: 30,color: primaryColor,))
                   : IconButton(
                        onPressed:_controller.clear,
                        icon: Icon(Icons.close,size: 28,color: Colors.grey),),
                    prefixIcon:Icon(Icons.search_rounded,size: 30,color: Colors.grey),
                  ),
                ),
              ),
            ),
          )),
    );
  }

}
