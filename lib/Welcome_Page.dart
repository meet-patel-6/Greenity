import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/database.dart';
import 'login_page.dart';

String? finalEmail;

// ignore: camel_case_types
class Welcome_Page extends StatefulWidget {
  const Welcome_Page({Key? key}) : super(key: key);

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

// ignore: camel_case_types
class _Welcome_PageState extends State<Welcome_Page> {
  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async {
      Timer(const Duration(seconds: 3), () {
        if (finalEmail == null) {
          Get.to(const LoginPage());
        } else {
          DatabaseMethods().getUserFromDBUser(finalEmail!);
        }
      });
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    // print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                width: 250,
                height: 250,
                image: AssetImage('img/tree_PNG104381.png'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Welcome to Greenity',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
