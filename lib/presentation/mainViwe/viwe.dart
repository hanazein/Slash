import 'package:flutter/material.dart';

import '../viwes/fav.dart';
import '../viwes/home.dart';
import '../viwes/my cart.dart';
import '../viwes/profile.dart';



class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = [
    HomePage(),
    FavPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white.withOpacity(0.8),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(

        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor: Colors.transparent,// Set the bottom navigation bar color to black
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.9),
        selectedLabelStyle: TextStyle(color: Colors.black), // Sets the selected item label color
        unselectedLabelStyle: TextStyle(color: Colors.black),
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
      icon: ImageIcon(
      AssetImage('assets/images/img_18.png'),

          ),
    label: 'Home',),
          BottomNavigationBarItem(
           icon: ImageIcon(
          AssetImage('assets/images/img_17.png'),

    ),
            label: 'Favorites',

          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/img_19.png'),

            ),
            label: 'My Cart',

          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/img_20.png'),

            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
