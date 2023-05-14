// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:greener_v1/Citizen/plant_details.dart';
import '../controllers/auth_controller.dart';
import './change_pass.dart';
import 'Profile_Settings.dart';
import 'add_slot_ct.dart';
import 'approval_request.dart';

class HamBurger extends StatefulWidget {
  const HamBurger({super.key});

  @override
  _HamBurgerState createState() => _HamBurgerState();
}

class _HamBurgerState extends State<HamBurger> {
  String fname = "a";
  String lname = "a";
  String email = "a";
  String imageUrl = '';

  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();
    setState(() {
      fname = vari.data()!['fname'];
      lname = vari.data()!['lname'];
      email = vari.data()!['email'];
      imageUrl = vari.data()!['profile-image'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.green.shade100,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(
                        top: 30,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$fname $lname',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profile_Settings(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_tree),
              title: const Text(
                'Donate Land',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Add_Slot_Ct(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.password),
              title: const Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePass(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'Plantation Request',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Plant_Details(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text(
                'Approved Request',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Aproval_Request(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                AuthController.instance.logout();
              },
            ),
          ],
        ));
  }
}
