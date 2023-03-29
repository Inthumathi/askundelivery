
import 'package:askun_delivery_app/UI%20Screen/searchpage/serachpage.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:badges/badges.dart' as badges;

import '../../../utilites/constant.dart';
import '../../homepage/homepage.dart';

// Banner Image
final List<String> imgList = [
  'assets/home/img1.png',
  'assets/home/img2.png',
  'assets/home/img3.png',
  'assets/home/img4.png',
  'assets/home/img5.png',
  'assets/home/img6.png',
];



class Category {
  final String title;
  final String image;
  final List<SubCategory> subCat;

  Category( {required this.title, required this.subCat,required this.image});
}

class SubCategory {
  final String title;

  SubCategory({required this.title});
}

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({Key? key}) : super(key: key);

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

class _GroceriesPageState extends State<GroceriesPage> {
  int _selectedCat = 0; // Initialized to 0, assuming the first category is selected by default
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late bool _showCartBadge;
  final int _cartBadgeAmount = 3;
   String _selectedCategoryTitle = "";




  List<Category> categories = [
    Category(
      title: "Rice and Product",
      image:  MyStrings.img3,
      subCat: [
        SubCategory(title: "Subcategory 1.1"),
        SubCategory(title: "Subcategory 1.2"),
        SubCategory(title: "Subcategory 1.3"),
      ],
    ),
    Category(
      title: "Masala and Spices",
      image: MyStrings.img3,

      subCat: [
        SubCategory(title: "Subcategory 2.1"),
        SubCategory(title: "Subcategory 2.2"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 0;

    return Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: blackColor)),
          backgroundColor: whiteColor,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SmallText(
              text: 'Groceries',
              color: primaryColor,
              fontWeight: FontWeight.bold,
              size: 18,
            ),
          ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(10.0),
              child:Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: _selectedCategoryTitle== "" ?SmallText(text: "Select Sub Category",fontWeight: FontWeight.w500,): SmallText(text: _selectedCategoryTitle,color: blackColor,
                  fontWeight: FontWeight.w500,
                  size: 18,),
              ),
            ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: serachPage()));
              },
              icon: Icon(
                Icons.search,
                size: 25,
                color: blackColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            _shoppingCartBadge()
          ],
        ),
        body: Row(
          children: [
            Material(
              elevation: 10,
              color: whiteColor,
              child: Container(
                width: 75,
                // color: circleColor,
                margin: const EdgeInsets.only(right: 15, top: 15),
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCat = i;
                          _selectedCategoryTitle = categories[i].title;

                        });
                      },
                     child: RotatedBox(
                        quarterTurns: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                          child: Column(
                            children: [

                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color:_selectedCat == i? primaryColor.withOpacity(0.7) : null,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomRight: Radius.circular(25)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 22,
                                      backgroundColor: _selectedCat == i? null:primaryColor.withOpacity(0.7),
                                      backgroundImage: AssetImage(categories[i].image,)),
                                ),
                              ),
                              Text(
                                "${categories[i].title}",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                    fontWeight:
                                    _selectedCat ==
                                        i
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: _selectedCat == i ? 14 : 14,
                                    color: _selectedCat == i
                                        ? primaryColor
                                        : Colors.black),textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // child: Container(
                      //   margin: const EdgeInsets.only(bottom: 25.0),
                      //   // width: 50,
                      //   constraints: BoxConstraints(minHeight: 60),
                      //   alignment: Alignment.center,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.only(
                      //         topRight: Radius.circular(10),
                      //         bottomRight: Radius.circular(10)),
                      //     // border: _selectedCat == i ? Border.all() : Border(),
                      //     color: _selectedCat == i
                      //         ? primaryColor
                      //         : Colors.transparent,
                      //     // borderRadius: BorderRadius.circular(9.0),
                      //   ),
                      //   child: RotatedBox(
                      //     quarterTurns: 4,
                      //     child: Text(
                      //       "${categories[i].title}",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .button
                      //           ?.copyWith(
                      //               fontWeight:
                      //                   _selectedCat ==
                      //                           i
                      //                       ? FontWeight.bold
                      //                       : FontWeight.normal,
                      //               fontSize: _selectedCat == i ? 12 : 12,
                      //               color: _selectedCat == i
                      //                   ? Colors.black
                      //                   : Colors.black),
                      //     ),
                      //   ),
                      // ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        disableCenter: false,
                        initialPage: 0,
                        enlargeCenterPage: false,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: categories[_selectedCat].subCat.length,
                      itemBuilder: (ctx, i) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(9.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "${categories[_selectedCat].subCat[i].title}",
                                ),
                              ),
                              Icon(Icons.chevron_right),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )

        // body: SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.only(
        //       top: 10,
        //       bottom: 10,
        //     ),
        //     child: Column(
        //       children: [
        //         CarouselSlider(
        //           items: imageSliders,
        //           carouselController: _controller,
        //           options: CarouselOptions(
        //               autoPlay: true,
        //               disableCenter: false,
        //               initialPage: 0,
        //               enlargeCenterPage: false,
        //               aspectRatio: 2.0,
        //               onPageChanged: (index, reason) {
        //                 setState(() {
        //                   _current = index;
        //                 });
        //               }),
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: imgList.asMap().entries.map((entry) {
        //             return GestureDetector(
        //               onTap: () => _controller.animateToPage(entry.key),
        //               child: Container(
        //                 width: 12.0,
        //                 height: 12.0,
        //                 margin: EdgeInsets.symmetric(
        //                     vertical: 8.0, horizontal: 4.0),
        //                 decoration: BoxDecoration(
        //                     shape: BoxShape.circle,
        //                     color:
        //                     (Theme.of(context).brightness == Brightness.dark
        //                         ? Colors.white
        //                         : primaryColor
        //                         .withOpacity(
        //                         _current == entry.key ? 0.9 : 0.4)))));
        //           }).toList(),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
        );
  }

  Widget _shoppingCartBadge() {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),

      showBadge: _showCartBadge,
      // badgeStyle: badges.BadgeStyle(
      //   badgeColor: color,
      // ),
      badgeContent: Text(
        _cartBadgeAmount.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: blackColor,
          ),
          onPressed: () {}),
    );
  }
}
