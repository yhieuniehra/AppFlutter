import 'package:flutter/material.dart';
// ignore: unused_import
import 'TripHome.dart';
import 'Business Screen.dart';
// ignore: unused_import
import 'SchoolScreen.dart';
import 'NotificationsScreen.dart';
import 'TourDetailsScreen.dart';



void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  // Danh sách các màn hình được điều hướng qua BottomNavigationBar
  final List<Widget> _screens = [
    const TripHome(),
     BusinessScreen(),
    TourDetailsScreen(),
    NotificationsScreen(),
    const SchoolScreen(),
    
    
    
    
  ];

  // Hàm thay đổi chỉ số được chọn và cập nhật màn hình
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // Thay đổi màn hình bên trong thân Scaffold
      body: _screens[_selectedIndex],  // Hiển thị màn hình dựa trên chỉ số được chọn
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined, color: Color(0xffAFAFAF), size: 30),
            label: 'Trip',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined, color: Color(0xffAFAFAF), size: 30),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Color(0xffAFAFAF), size: 27),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Color(0xffAFAFAF), size: 30),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xffAFAFAF), size: 30),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 21, 14, 14),  // Màu của tab đang chọn
        onTap: _onItemTapped,  // Gọi hàm để thay đổi chỉ số tab
        
      ),
      backgroundColor: Colors.white,
    );
    
  }
}
