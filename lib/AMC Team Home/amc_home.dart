// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greener_v1/Citizen/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AMC_Home extends StatefulWidget {
  const AMC_Home({Key? key}) : super(key: key);

  @override
  State<AMC_Home> createState() => AMC_HomeState();
}

class AMC_HomeState extends State<AMC_Home> {
  int accept = 0, delete = 0;

  String mname = "";

  String tid = "";

  var token = HomePageState().getToken().toString();
  void sendPushmessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAS0spKYE:APA91bGl_melbX4I_jj5GSi2FlumbYuX_Kivmbbp2ifpruF7qQwWtDNYksFEJC14HxLDYYiCoadztRQE6C0ET4p85zpWvvKBGva03UwNYwPF8gWMp0c1XW6NkfK2lfPhE6yHwkm2aUsY'
        },
        body: jsonEncode(<String, dynamic>{
          'priority': 'high',
          'data': <String, dynamic>{
            'click-action': 'FLUTTER_NOTIFICATION_CLICK',
            'status': 'done',
            'body': body,
            'title': title,
          },
          "notification": <String, dynamic>{
            "title": title,
            "body": body,
            "android_channel_id": "Greener"
          },
          "to": token,
        }),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getData() async {
    var user = FirebaseAuth.instance.currentUser;
    var vari = await FirebaseFirestore.instance
        .collection('accepted')
        .doc(user?.uid)
        .get();
    setState(() {
      mname = vari.data()!['fname'];
      tid = vari.data()!['mobile'];
    });
  }

  int? free, subscription;
  getPlan() async {
    final vari = await FirebaseFirestore.instance
        .collection('counter')
        .doc('Zc46be3BLL4nniTDk72R')
        .get();
    setState(() {
      free = vari.data()!['free'];
      subscription = vari.data()!['paid'];
      accept = vari.data()!['accepted'];
      delete = vari.data()!['deleted'];
    });
    return 1;
  }

  var askToPlant = FirebaseDatabase.instance.ref().child('AskToPlant');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('AskToPlant');

  late DatabaseReference dRef;

  CollectionReference accepted = FirebaseFirestore.instance.collection('Accepted');

  late DatabaseReference ref;

  CollectionReference user = FirebaseFirestore.instance.collection('Deleted');

  late DatabaseReference noti;
  CollectionReference use =
      FirebaseFirestore.instance.collection('mobile_number');

  late DatabaseReference place;
  CollectionReference pl = FirebaseFirestore.instance.collection('place otp');

  CollectionReference otp = FirebaseFirestore.instance.collection('place otp');

  @override
  void initState() {
    getData();
    getPlan();
    super.initState();
    dRef = FirebaseDatabase.instance.ref().child('Accepted');
    ref = FirebaseDatabase.instance.ref().child('Deleted');
    noti = FirebaseDatabase.instance.ref().child('mobile_number');
    place = FirebaseDatabase.instance.ref().child('place otp');
  }

  Widget listItem({required Map allRequest}) {
    String name = allRequest['Name'];
    String placeName = allRequest['PlaceName'];
    String date = allRequest['date'];
    String email = allRequest['email'];
    String mobileNumber = allRequest['mobile_number'];
    String timeSlot = allRequest['time_slot'];
    String plan = allRequest['plan'];
    mobileNumber = allRequest['mobile_number'];
    String token = allRequest['token'];

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
      height: 215,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Name : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                allRequest['Name'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Place Name : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                allRequest['PlaceName'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Date : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                allRequest['date'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Email : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                allRequest['email'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Mobile Number : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                allRequest['mobile_number'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text(
                'Time : ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              Text(
                allRequest['time_slot'],
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () async {
                  int timestamp = DateTime.now().millisecondsSinceEpoch;
                  sendPushmessage(token, "Your Otp is $timestamp.",
                      " Request Accepted, Now You Can Plant A Tree.");
                  // showAlertDialog(allRequest: allRequest);
                  if (mname != "const " && tid != "") {
                    Map<String, String> addNewSlot = {
                      'Name': name,
                      'PlaceName': placeName,
                      'date': date,
                      'email': email,
                      'mobile_number': mobileNumber,
                      'time_slot': timeSlot,
                      'plan': plan,
                      'MName': mname,
                      'TID': tid,
                    };

                    dRef.push().set(addNewSlot);

                    var now = DateTime.now();
                    var formatter = DateFormat('dd-MM-yyyy');
                    String formattedDate = formatter.format(now);

                    String tdata =
                        DateFormat("hh:mm:ss a").format(DateTime.now());

                    await otp.doc(timestamp.toString()).set({
                      'id': timestamp.toString(),
                      'place': placeName,
                    });

                    Map<String, String> mobile = {
                      'Mobile_Number': mobileNumber,
                      'Place_Name': placeName,
                      'title': 'Your Plantation Request Accepted',
                      'message': 'You can plant a tree at $placeName.',
                      'date': formattedDate,
                      'time': tdata,
                      'otp': timestamp.toString(),
                    };

                    noti.push().set(mobile);

                    Map<String, String> placeotp = {
                      'id': timestamp.toString(),
                      'place': placeName,
                    };

                    place.push().set(placeotp);

                    reference.child(allRequest['key']).remove();
                    if (plan == 'Free') {
                      free = (free! - 1);
                      FirebaseFirestore.instance
                          .collection("counter")
                          .doc('Zc46be3BLL4nniTDk72R')
                          .update({'free': free});
                      FirebaseFirestore.instance
                          .collection("counter")
                          .doc('Zc46be3BLL4nniTDk72R')
                          .update({'accepted': accept + 1});
                    }
                    setState(() {});

                    Fluttertoast.showToast(
                        msg: "Request Accepted",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0,
                        backgroundColor: Colors.black38);

                    accept = accept + 1;
                  }
                },
                icon: const Icon(
                  // <-- Icon
                  Icons.done,
                  size: 24.0,
                ),
                label: const Text('Accept'), // <-- Text
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () async {
                  sendPushmessage(token, "We Are Sorry! ",
                      " Request Rejected, Please Try Again Later.");
                  if (mname != "" && tid != "") {
                    Map<String, String> addNewSlot = {
                      'Name': name,
                      'PlaceName': placeName,
                      'date': date,
                      'email': email,
                      'mobile_number': mobileNumber,
                      'time_slot': timeSlot,
                      'plan': plan,
                      'MName': mname,
                      'TID': tid,
                    };

                    ref.push().set(addNewSlot);

                    Map<String, String> mobile = {
                      'Mobile_Number': mobileNumber,
                      'Place_Name': placeName,
                      'token': token,
                      'title': 'Your Plantation Request Rejected',
                      'message': 'You Should send Request to an Other Place.',
                    };

                    noti.push().set(mobile);

                    reference.child(allRequest['key']).remove();
                    if (plan == 'Free') {
                      free = (free! - 1);
                      FirebaseFirestore.instance
                          .collection("counter")
                          .doc('Zc46be3BLL4nniTDk72R')
                          .update({'free': free});
                      FirebaseFirestore.instance
                          .collection("counter")
                          .doc('Zc46be3BLL4nniTDk72R')
                          .update({'deleted': delete + 1});
                    }
                    setState(() {});

                    Fluttertoast.showToast(
                        msg: "Request Rejected",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0,
                        backgroundColor: Colors.black38);

                    delete = delete + 1;
                  }
                },
                icon: const Icon(
                  Icons.close,
                  size: 24.0,
                ),
                label: const Text('Reject'), // <-- Text
              ),
            ],
          ),
        ],
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
        title: const Text("AMC Team"),
        backgroundColor: Colors.green,
        actions: [
          Center(
            child: Text(
              "Total: $free  ",
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.green[200],
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: askToPlant,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map allRequest = snapshot.value as Map;
            allRequest['key'] = snapshot.key;

            return (allRequest['plan'] == 'Free')
                ? listItem(allRequest: allRequest)
                : nullWidget();
          },
        ),
      ),
    );
  }
}
