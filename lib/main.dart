import 'package:flutter/material.dart';
import 'package:flutter_demo/vechile_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: VechileListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}





