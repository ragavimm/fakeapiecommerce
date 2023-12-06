import 'package:fakeapiecommerce/favorite.dart';
import 'package:fakeapiecommerce/homepage.dart';
import 'package:flutter/material.dart';

import 'account.dart';
import 'alert.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  var index=0;
  var screens=[
    MyHomePage(),
    AlertPage(),
    FavoritePage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        selectedItemColor:Colors.red,
        currentIndex: index,
        onTap: (value){
          setState(() {
            index=value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home', backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert_sharp), label: 'Alert',backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorite',backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Account',backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}


