// import 'package:appbar_example/main.dart';
// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';

class Sponsor_Nav extends StatefulWidget {
  const Sponsor_Nav({super.key});

  @override
  _Sponsor_NavState createState() => _Sponsor_NavState();
}

class _Sponsor_NavState extends State<Sponsor_Nav> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Sponsors"),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.lightGreen],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(
                    icon: Icon(Icons.security_rounded),
                    text: 'Current Sponsor'),
                Tab(icon: Icon(Icons.new_releases), text: 'New Request'),
              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(
            children: [
              buildPage('Current sponsor'),
            ],
          ),
        ),
      );

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 28),
        ),
      );
}
