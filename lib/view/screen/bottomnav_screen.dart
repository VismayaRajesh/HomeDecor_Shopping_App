import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';
import 'package:homedecor_shopping_app/view/screen/categories_screen.dart';
import 'package:homedecor_shopping_app/view/screen/homescreen.dart';
import 'package:homedecor_shopping_app/view/screen/notification_screen.dart';
import 'package:homedecor_shopping_app/view/screen/profile_screen.dart';
import 'package:homedecor_shopping_app/view/screen/wishlist_screen.dart';

class BottomnavScreen extends StatefulWidget {
  final String? userName;
  final String? emuserName;
  const BottomnavScreen({super.key,  this.userName, this.emuserName});

  @override
  State<BottomnavScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<BottomnavScreen> {
  int _selectedIndex = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      Homescreen(userName: widget.userName ?? 'Guest',emuserName: widget.emuserName ?? 'Guest'),
      CategoriesScreen(userName: widget.userName ?? 'Guest', emuserName: widget.emuserName ?? 'Guest'),
      WishlistScreen(),
      NotificationScreen(),
      ProfileScreen(userName: widget.userName ?? 'Guest', emuserName: widget.emuserName ?? 'Guest'),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(MyAppIcon.home, 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(MyAppIcon.category, 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(MyAppIcon.outlinedfav, 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(MyAppIcon.notification, 3),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(MyAppIcon.profilecircle, 4),
            label: '',
          ),
        ],
        selectedItemColor: const Color.fromRGBO(153, 133, 88, 1),
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    return _selectedIndex == index
        ? Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(153, 133, 88, 1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 28,
      ),
    )
        : Icon(iconData, size: 28);
  }
}
