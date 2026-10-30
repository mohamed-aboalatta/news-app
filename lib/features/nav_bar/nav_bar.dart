import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/home/home_screen.dart';
import 'package:news_app/features/search/search_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List<Widget> screens = [HomeScreen(), SearchScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Color(0xffFFA500),
        color: Color(0xff001F3F),
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },

        key: _bottomNavigationKey,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home, color: Colors.white),label: "Home",labelStyle: TextStyle(color: Colors.white)
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search, color: Colors.white),label: "Search",labelStyle: TextStyle(color: Colors.white)
          ),
        ],
      ),
      body: screens[index],
    );
  }
}
