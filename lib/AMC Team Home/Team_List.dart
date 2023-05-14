// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Team_List extends StatefulWidget {
  const Team_List({Key? key}) : super(key: key);

  @override
  State<Team_List> createState() => _Team_ListState();
}

class _Team_ListState extends State<Team_List> {
  var teamMember = FirebaseDatabase.instance.ref().child('Team Members');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Team Members');

  String imageUrl = '';
  void getData() async {
    var user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();
    setState(() {
      imageUrl = vari.data()!['profile-image'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget listItem({required Map tmDetails}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      height: 100,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(tmDetails['profile-image']),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Name: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 180,
                    child: Text(
                      tmDetails['fname'] + ' ' + tmDetails['lname'],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    'Email: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 180,
                    child: Text(
                      tmDetails['email'],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    'Team ID: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  ),
                  Text(
                    tmDetails['TeamId'].toString(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AMC Team"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.green[200],
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: teamMember,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map tmDetails = snapshot.value as Map;
            tmDetails['key'] = snapshot.key;

            return listItem(tmDetails: tmDetails);
          },
        ),
      ),
    );
  }
}
