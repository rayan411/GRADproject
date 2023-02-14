import 'package:bridge/pages/loginPages/auth.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'profilePage.dart';
import 'explorePages.dart';
import 'learnPage.dart';
import 'package:bridge/models/paths.dart';

class MyBottomBar extends StatefulWidget {

  
  MyBottomBar();
  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
//for navigaton par
  int _selectedIndex = 0;
//keep logged in user 
  final User? user = AuthPage().currentUser;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late List<Widget> _pages; 
@override
  void initState() {
    _pages=  [ExplorePage(), LearnPage(), ProfilePage()];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      //Bottom Navigation Bar ------------------------------------------------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view_sharp,
              ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: ColorSelect.Color5,
        selectedItemColor:ColorSelect.Color1,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,        
        unselectedItemColor:  Color.fromARGB(119, 168, 168, 168),

      ),
    );
  }
}
