// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> {
  var mno;

  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();
    setState(() {
      mno = vari.data()!['mobile'].toString();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  var notification = FirebaseDatabase.instance.ref().child('mobile_number');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('mobile_number');

  Widget listItem({required Map nDetails}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.green,
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      height: 130,
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade100,
        elevation: 18,
        shadowColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nDetails['time'],
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  nDetails['date'],
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  nDetails['title'],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              nDetails['message'],
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            nDetails['otp'] != ""
                ? Row(
                    children: [
                      const Text(
                        "Your Plantation Otp: ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        nDetails['otp'],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      IconButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Copied",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 16.0,
                                backgroundColor: Colors.black38);
                            Clipboard.setData(
                                ClipboardData(text: nDetails['otp']));
                          },
                          icon: const Icon(
                            Icons.copy,
                            color: Colors.black,
                            size: 18,
                          )),
                      // Icon(Icons.copy),
                    ],
                  )
                : const SizedBox(
                    height: 1,
                  ),
          ],
        ),
      ),
    );
  }

  Widget nullWidget() {
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.green[100],
        title: const Text("Notification", style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: notification,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map nDetails = snapshot.value as Map;
            nDetails['key'] = snapshot.key;

            return (nDetails['Mobile_Number'] == mno)
                ? listItem(nDetails: nDetails)
                : nullWidget();
          },
        ),
      ),
    );
  }
}
