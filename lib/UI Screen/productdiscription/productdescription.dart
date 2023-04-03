import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDescription extends StatefulWidget {
  ProductDescription({
    Key? key,
  }) : super(key: key);

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  final List<String> images = [
    'https://picsum.photos/id/1015/300/200',
    'https://picsum.photos/id/1016/300/200',
    'https://picsum.photos/id/1018/300/200',
    'https://picsum.photos/id/1021/300/200',
    'https://picsum.photos/id/1023/300/200'
  ];
  String dropdownValue = '100kg';
  int _counter = 0;
  int activeButton= 0;
  int _cartBadgeAmount = 0;
  bool?_showCartBadge;
  Color color = Colors.red;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f3f3),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: whiteColor)),
        backgroundColor: primaryColor,
        title: Text("Product description"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final String imageUrl = images[index];
              return Image.network(imageUrl, fit: BoxFit.cover);
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              initialPage: 0,
            ),
          ),
          heightSpace,
          heightSpace,
          Column(
            children: [
              Container(
                color: whiteColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                          text: "Kurnool Old Rice",
                          fontWeight: FontWeight.w600,
                          size: 20),
                      heightSpace,
                      Row(
                        children: [
                          SmallText(
                            text: "Qty",
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              items: <String>['100kg', '200kg']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: SmallText(
                                    text: value,
                                    color: primaryColor,
                                    size: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                      SmallText(
                        text: "MRP",size: 20,
                      ),
                      heightSpace,
                      heightSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            Container(
                              child: Center(child: SmallText(text: "Add to Cart",color: Colors.white,)),
                              width: 120,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: primaryColor,
                                border: Border.all(width: 1.0, color: primaryColor),
                              ),

                              ),
                          ],
                        ),


                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Align(
                  alignment: Alignment.topLeft,
                    child: SmallText(text: "Description",size: 20,fontWeight: FontWeight.w600)),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
