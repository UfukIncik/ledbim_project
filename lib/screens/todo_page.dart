// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Widget/todo_item.dart';
import '../screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: _buildAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    "All ToDos",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                ToDoItem(),
                ToDoItem(),
                ToDoItem(),
                ToDoItem(),
                ToDoItem(),
                ToDoItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("ToDoPage"),
      actions: [
        IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginDemo()));
            },),
      ],
    );
  }
}
