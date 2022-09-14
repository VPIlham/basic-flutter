import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/bottomNavbar.dart';
import 'package:flutter_basic/pages/form.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Basic',
        debugShowCheckedModeBanner: false,
        home: BottomNavbarPage());
  }
}
