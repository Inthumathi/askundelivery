import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ProductDescription extends StatefulWidget {
  ProductDescription({Key? key,}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,20),
            child: SmallText(text: "Kurnool Old Rice",fontWeight: FontWeight.w600,),
          ),
        ],
      ),
    );
  }
}
