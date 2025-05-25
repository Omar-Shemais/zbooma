import 'package:flutter/material.dart';
import 'package:zbooma/screens/data/data.dart';
import 'package:zbooma/screens/TheForm/form.dart';
import 'package:zbooma/screens/our/ourfiles.dart';
import 'package:zbooma/screens/worktrip/worktrip.dart';

class BNB extends StatefulWidget {
  final int userId;
  final String token;

  const BNB({super.key, required this.userId, required this.token});

  @override
  _BNBState createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      Ourfiles(),
      WorkTrip(clientId: widget.userId),
      TheFFFFFF(userId: widget.userId),
      DATA(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xff0f1f21),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/our2.png',
              width: 24,
              height: 24,
              color: Colors.grey[400],
            ),
            activeIcon: Image.asset(
              'assets/our2.png',
              width: 24,
              height: 24,
              color: Colors.green,
            ),
            label: 'الخدمات',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon.png',
              width: 24,
              height: 24,
              color: Colors.grey[400],
            ),
            activeIcon: Image.asset(
              'assets/icon.png',
              width: 24,
              height: 24,
              color: Colors.green,
            ),
            label: 'رحلة العمل',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list_alt_outlined, color: Colors.grey),
            activeIcon:
                const Icon(Icons.list_alt_outlined, color: Colors.green),
            label: 'الفورم',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/databnb.png',
              width: 24,
              height: 24,
              color: Colors.grey[400],
            ),
            activeIcon: Image.asset(
              'assets/databnb.png',
              width: 24,
              height: 24,
              color: Colors.green,
            ),
            label: 'البيانات',
          ),
        ],
      ),
    );
  }
}
