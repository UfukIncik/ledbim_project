// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ledbim_project/model/users_model.dart';
import 'package:ledbim_project/screens/login_screen.dart';
import 'package:ledbim_project/service/storage.dart';
import 'package:ledbim_project/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserService _service = UserService();
  bool? isLoading;
  final SecureStorage secureStorage = SecureStorage();

  List<UsersModelData?> users = [];

  @override
  void initState() {
    super.initState();
    _service.fetchUsers().then((value) {
      if (value != null && value.data != null) {
        setState(() {
          users = value.data!;
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

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
              onPressed: () async {
                secureStorage.deleteSecureData('email');

                // final SharedPreferences sharedPreferences =
                //     await SharedPreferences.getInstance();
                // sharedPreferences.remove('email');
                Get.to(() => LoginDemo()); //Getx
              })
        ],
      ),
      body: isLoading == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : isLoading == true
              ? ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          users[index]!.firstName! + users[index]!.lastName!),
                      subtitle: Text(users[index]!.email!),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(users[index]!.avatar!),
                      ),
                    );
                  })
              : Center(
                  child: Text("An Error Occured.."),
                ),
    );
  }
}
