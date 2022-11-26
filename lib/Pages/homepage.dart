// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ledbim_project/Pages/login_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginDemo()));
            })
        ],
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("HomePage")
          ],
        ),
    );
  }
}
