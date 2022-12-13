// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledbim_project/screens/homepage.dart';
import 'package:ledbim_project/screens/login_screen.dart';
import 'package:ledbim_project/screens/todo_page.dart';
import 'package:ledbim_project/service/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  String? finalEmail;
  int currentIndex = 0;
  final SecureStorage secureStorage = SecureStorage();
  final screens = [
    const HomePage(),
    const ToDoPage(),
  ];
  @override
  void initState() {
    super.initState();
    secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
      print(finalEmail);
    });
    Timer(
        Duration(milliseconds: 1),
        () => Get.to(
            () => finalEmail == null ? LoginDemo() : BottomNavBarPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: "ToDo",
          ),
        ],
      ),
    );
  }
}
