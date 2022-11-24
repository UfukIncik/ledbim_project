// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ledbim_project/Pages/bottom_nav_bar_pages.dart';
import 'package:ledbim_project/Pages/homepage.dart';
import 'package:ledbim_project/Pages/login_screen.dart';
import 'package:ledbim_project/Pages/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ledbim',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginDemo(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
