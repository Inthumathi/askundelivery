import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../utilites/constant.dart';
import 'demo.dart';
import 'homepage/homepage.dart';


class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  final widgetOptions = [
    HomeScreen(),
    DemoPage(),
    HomeScreen(),
    DemoPage(),
    HomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: DiamondBottomNavigation(
          itemIcons: const [
            Icons.home,
            Icons.notifications,
            Icons.message,
            Icons.account_box,
          ],
          centerIcon: Icons.search_rounded,
          selectedIndex: selectedIndex,
          onItemPressed: onItemTapped,
          unselectedColor: primaryColor,
          selectedColor: blackColor,
          selectedLightColor: primaryColor,
          height: 40,
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor:Colors.black,
      //   showUnselectedLabels: true,
      //   backgroundColor: Colors.pinkAccent,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined), title: Text('Home',)),
      //     BottomNavigationBarItem(icon:  Icon(Icons.search), title: Text('Search')),
      //     BottomNavigationBarItem(icon: Icon(Icons.pause_circle_outline), title: Text('Courses')),
      //     BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in_outlined),title: Text('Wishlist')),
      //     BottomNavigationBarItem(icon: Icon(Icons.rate_review_outlined), title: Text('Testimonial')),
      //     BottomNavigationBarItem(icon: Icon(Icons.account_circle),title: Text('Account')),
      //   ],
      //   currentIndex: selectedIndex,
      //   fixedColor:primaryColor,
      //   onTap: onItemTapped,
      // ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}