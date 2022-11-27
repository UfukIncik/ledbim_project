// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ledbim_project/screens/homepage.dart';
import 'package:ledbim_project/screens/login_screen.dart';
import 'package:ledbim_project/screens/todo_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {

@override
  void initState(){
getValidationData().whenComplete(() async{
  Timer(Duration(seconds: 2),() => Get.to(() =>finalEmail == null ? LoginDemo() : BottomNavBarPage()));
});
}

int currentIndex=0;
  final screens = [
    const HomePage(),
    const ToDoPage(),
  ];

  Future getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString("email");
    setState(() {
      finalEmail = obtainedEmail!;
    });    
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