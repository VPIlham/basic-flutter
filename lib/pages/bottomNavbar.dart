import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/form.dart';
import 'package:flutter_basic/pages/home.dart';
import 'package:flutter_basic/pages/list.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int selectedState = 0;
  List pageData = [
    HomePage(),
    FormPage(
      alamat: 'depok',
      umur: 20,
      name: 'ilham',
    ),
    ListPage(),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      selectedState = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageData.elementAt(selectedState),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: 'Form',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'List',
            ),
          ],
          currentIndex: selectedState,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          elevation: 4,
          showUnselectedLabels: true,
          onTap: _changeSelectedNavBar),
    );
  }
}
