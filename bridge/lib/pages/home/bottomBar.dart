import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'profilePage.dart';
import 'explorePages.dart';
import 'learnPage.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
//for navigaton par
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [ExplorePage(), LearnPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      //Bottom Navigation Bar ------------------------------------------------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              // Icons.lens_blur_sharp
              Icons.grid_view,
              ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
          ),
        ],
        backgroundColor: ColorSelect.Color1,
        selectedItemColor:ColorSelect.Color5,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,        
        unselectedItemColor:  ColorSelect.Color3,

      ),
    );
  }
}
