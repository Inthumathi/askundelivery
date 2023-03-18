import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utilites/constant.dart';
import '../../utilites/strings.dart';
import '../../widget/smalltext.dart';

// Banner Image
final List<String> imgList = [
  'assets/home/img1.png',
  'assets/home/img2.png',
  'assets/home/img3.png',
  'assets/home/img4.png',
  'assets/home/img5.png',
  'assets/home/img6.png',
];

// Language
class Language {
  Locale locale;
  String langName;

  Language({required this.locale, required this.langName});
}

// Banner fetch image

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(item, fit: BoxFit.cover, width: 1000.0)),
          ),
        ))
    .toList();

// Categories

class DailyNeeds {
  final String cateName;
  final String img;

  DailyNeeds({required this.cateName, required this.img});
}

class Food {
  final String cateName;
  final String img;

  Food({required this.cateName, required this.img});
}

class Service {
  final String cateName;
  final String img;

  Service({required this.cateName, required this.img});
}

class Picks {
  final String cateName;
  final String img;

  Picks({required this.cateName, required this.img});
}

class Groceries {
  final String cateName;
  final String img;

  Groceries({required this.cateName, required this.img});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DailyNeeds> DailyNeedsList = <DailyNeeds>[
    DailyNeeds(
      cateName: "groceries",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "meal",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "vegetableandFruits",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "dairyProducts",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "prasadatu",
      img: MyStrings.img3,
    ),
    DailyNeeds(
      cateName: "homeFoods",
      img: MyStrings.img3,
    ),
  ];

  List<Food> Foodlist = <Food>[
    Food(
      cateName: "spicyFamilyResturant",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "kritungaResturant",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "tastyFoodCourt",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "bakery-RupaBakery",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "teaTime",
      img: MyStrings.img3,
    ),
    Food(
      cateName: "grandsVajraj's",
      img: MyStrings.img3,
    ),
  ];
  List<Service> AskforService = <Service>[
    Service(
      cateName: "electrician",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "plumber",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "painting",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "appliances",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "cabServices",
      img: MyStrings.img3,
    ),
    Service(
      cateName: "packersandMovers",
      img: MyStrings.img3,
    ),
  ];
  List<Picks> TopPicksforYou = <Picks>[
    Picks(
      cateName: "doorRepairs",
      img: MyStrings.img3,
    ),
    Picks(
      cateName: "broadBeans",
      img: MyStrings.img3,
    ),
    Picks(
      cateName: "mutton",
      img: MyStrings.img3,
    ),
  ];
  List<Groceries> Groceriespage = <Groceries>[
    Groceries(
      cateName: "riceandRicaProduct",
      img: MyStrings.img3,
    ),
    Groceries(
      cateName: "masalaandSpices",
      img: MyStrings.img3,
    ),
    Groceries(
      cateName: "flours",
      img: MyStrings.img3,
    ),
    Groceries(
      cateName: "bodySkinandHair",
      img: MyStrings.img3,
    ),
    Groceries(
      cateName: "choclatesandBiscuits",
      img: MyStrings.img3,
    ),
    Groceries(
      cateName: "healthDrinks",
      img: MyStrings.img3,
    ),
  ];
  List<Language> languageList = [
    Language(langName: 'తెలుగు', locale: const Locale('te', 'TE')),
    Language(langName: 'हिंदी', locale: const Locale('hi', 'HI')),
    Language(langName: 'English', locale: const Locale('en', 'US')),
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();
  late String selectedLanguage;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    selectedLanguage = getFlag('DE');
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: circleColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(

          borderRadius: const BorderRadius.all(Radius.circular(16))),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.black,
            iconColor: Colors.black,
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Container(
                      // width: 100.0,
                      // height: 100.0,
                      margin: const EdgeInsets.only(
                        top: 24.0,
                        bottom: 20.0,
                        left: 10,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                      ),
                      child:Image.asset(
                        'assets/logo.png',
                        height: 75,
                        width: 75,
                      ),
                    ),
                    widthSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: primaryColor,
                              size: 28.0,
                            ),
                            SizedBox(width: 5,),
                            Container(
                                width: MediaQuery.of(context).size.width/2.4,
                                child: SmallText(text: 'Venkata Narasimha',size: 16,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: primaryColor,
                              size: 28.0,
                            ),
                            SizedBox(width: 5,),
                            SmallText(text: '9876543210',size: 16,),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
                heightSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: primaryColor,
                  ),
                ),
                heightSpace,
                heightSpace,

                ListTile(
                  contentPadding: EdgeInsets.only(left: 30),
                  onTap: () {},
                  leading: Image(image: const AssetImage('assets/drawer/orderhistoy.png'),),
                  title: SmallText(text: MyStrings.orderHistory,fontWeight: FontWeight.w500,),
                ),

                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading:  Image(image: const AssetImage('assets/drawer/offer.png'),),
                  title: SmallText(text: MyStrings.offers,fontWeight: FontWeight.w500,),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading: Image(image: const AssetImage('assets/drawer/wallet.png'),),
                  title: SmallText(text: MyStrings.wallet,fontWeight: FontWeight.w500,),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading:Image(image: const AssetImage('assets/drawer/refer.png'),),
                  title: SmallText(text: MyStrings.refer,fontWeight: FontWeight.w500,),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading: Image(image: const AssetImage('assets/drawer/complain.png'),),
                  title: SmallText(text: MyStrings.allCompliant,fontWeight: FontWeight.w500,),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading: Image(image: const AssetImage('assets/drawer/replacement.png'),),
                  title: SmallText(text: MyStrings.replacementRequest,fontWeight: FontWeight.w500,),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading: Image(image: const AssetImage('assets/drawer/rateus.png'),),
                  title: SmallText(text: MyStrings.rateUs,fontWeight: FontWeight.w500,),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading: Image(image: const AssetImage('assets/drawer/faq.png'),),
                  title: SmallText(text: MyStrings.faq,fontWeight: FontWeight.w500,),
                ),

                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading: Image(image: const AssetImage('assets/drawer/about.png'),),
                  title: SmallText(text: MyStrings.aboutUs,fontWeight: FontWeight.w500,),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading: Image(image: const AssetImage('assets/drawer/terms.png'),),
                  title: SmallText(text: MyStrings.termsOfUse,fontWeight: FontWeight.w500,),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading: Image(image: const AssetImage('assets/drawer/privacy.png'),),
                  title: SmallText(text: MyStrings.privacyAndpolicy,fontWeight: FontWeight.w500,),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 30,top: 5),
                  onTap: () {},
                  leading:Image(image: const AssetImage('assets/drawer/logout.png'),),
                  title: SmallText(text: MyStrings.logOut,fontWeight: FontWeight.w500,),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor:primaryColor,
          title:  SmallText(text: "Logo",size: 25,),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()async {
                // launch("whatsapp://send?phone=+91 9502572662 &text=HELLO");
                  const url = 'https://api.whatsapp.com/send?phone=+919502572662&text=HELLO';
                  if (await canLaunch(url)) {
                  await launch(url);
                  } else {
                  throw 'Could not launch $url';
                  }
                },
                child: Image.asset(
                  "assets/home/whatsapp.png",
                  width: 45.0,
                  height: 45.0,
                ),
              ),
            ),
            SizedBox(width: 5,),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  launch("tel:9502572662");
                },
                child: Icon(
                  Icons.call,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),

          ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(35.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widthSpace,
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: whiteColor,
                      ),
                      SizedBox(width: 5,),
                      Row(
                        children: [
                          InkWell(
                            onTap:  () {

                            },
                            child: SmallText(
                            text: "Delivery Location",
                              color: whiteColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Icon(Icons.keyboard_arrow_down_sharp, color: whiteColor,),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            )
        ),

        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Row(
        //     children: [
        //       Icon(Icons.location_on),
        //       SizedBox(
        //         width: 5,
        //       ),
        //       SmallText(
        //         text: 'chennai',
        //         size: 20,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(top: 5.0),
        //         child: Icon(
        //           Icons.keyboard_arrow_down_sharp,
        //           size: 30,
        //         ),
        //       )
        //     ],
        //   ),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 12.0),
        //       child: Icon(
        //         Icons.search_rounded,
        //         size: 30,
        //       ),
        //     )
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : primaryColor)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                heightSpace,
                heightSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                        color: containerLightColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: 'selectLanguage'.tr(),
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                          Row(
                            children: languageList.map((Language language) {
                              return Expanded(
                                child: RadioListTile<Locale>(
                                  activeColor: primaryColor,
                                  title: SmallText(
                                    text: language.langName,
                                    size: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  value: language.locale,
                                  groupValue: Localizations.localeOf(context),
                                  onChanged: (Locale? value) {
                                    setState(() {
                                      context.setLocale(value!);
                                    });
                                  },
                                  contentPadding: EdgeInsets.zero,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: 'dailyneeds'.tr(),
                            fontWeight: FontWeight.w500,
                          ),
                          Row(
                            children: [
                              SmallText(
                                text: 'seeAll'.tr(),
                                size: 14,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: circleColor,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: primaryColor,
                                  )),
                            ],
                          )
                        ],
                      ),
                      heightSpace,
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2.2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: DailyNeedsList.length,
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          // controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: containerColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            DailyNeedsList[index].img,
                                          ),
                                          heightSpace,
                                          SmallText(
                                            text: DailyNeedsList[index]
                                                .cateName
                                                .tr(),
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            size: 14,
                                            textAlign: TextAlign.center,
                                            maxline: 1,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          }),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: 'foods&Beverages'.tr(),
                            fontWeight: FontWeight.w500,
                          ),
                          Row(
                            children: [
                              SmallText(
                                text: 'seeAll'.tr(),
                                size: 14,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: circleColor,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: primaryColor,
                                  )),
                            ],
                          )
                        ],
                      ),
                      heightSpace,
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2.2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: Foodlist.length,
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          // controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: containerColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Foodlist[index].img,
                                          ),
                                          heightSpace,
                                          SmallText(
                                            text: Foodlist[index].cateName.tr(),
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            size: 14,
                                            textAlign: TextAlign.center,
                                            maxline: 1,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          }),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: 'askforServices'.tr(),
                            fontWeight: FontWeight.w500,
                          ),
                          Row(
                            children: [
                              SmallText(
                                text: 'seeAll'.tr(),
                                size: 14,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: circleColor,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: primaryColor,
                                  )),
                            ],
                          )
                        ],
                      ),
                      heightSpace,
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2.2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: AskforService.length,
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          // controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: containerColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AskforService[index].img,
                                          ),
                                          heightSpace,
                                          SmallText(
                                            text: AskforService[index]
                                                .cateName
                                                .tr(),
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            size: 14,
                                            textAlign: TextAlign.center,
                                            maxline: 1,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          }),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: 'TopPicksForYou'.tr(),
                            fontWeight: FontWeight.w500,
                          ),
                          Row(
                            children: [
                              SmallText(
                                text: 'seeAll'.tr(),
                                size: 14,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: circleColor,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: primaryColor,
                                  )),
                            ],
                          )
                        ],
                      ),
                      heightSpace,
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2.2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: TopPicksforYou.length,
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          // controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: containerColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            TopPicksforYou[index].img,
                                          ),
                                          SmallText(
                                            text: TopPicksforYou[index]
                                                .cateName
                                                .tr(),
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            size: 14,
                                            textAlign: TextAlign.center,
                                            maxline: 1,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          }),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: 'groceries'.tr(),
                            fontWeight: FontWeight.w500,
                          ),
                          Row(
                            children: [
                              SmallText(
                                text: 'seeAll'.tr(),
                                size: 14,
                                color: primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: circleColor,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: primaryColor,
                                  )),
                            ],
                          )
                        ],
                      ),
                      heightSpace,
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 2.2,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: Groceriespage.length,
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          // controller: ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: containerColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Groceriespage[index].img,
                                          ),
                                          SmallText(
                                            text: Groceriespage[index]
                                                .cateName
                                                .tr(),
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            size: 14,
                                            textAlign: TextAlign.center,
                                            maxline: 1,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  String getFlag(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
