// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'add_slot_ct.dart';
import 'notification.dart';
import 'notification_service.dart';

bool notificationScheduled = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String email = "Email Loading...";
  String Name = '';
  String BirthDate = 'Null';
  late int dd;
  late int mm;
  late int yyyy;
  late String token;
  FirebaseAuth auth = FirebaseAuth.instance;
  int FinalCount = 0;

  String? mtoken = " ";

  getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
      });
      saveToken(token!);
    });
  }

  getPlan() async {
    //return FirebaseFirestore.instance.collection('users').doc(userId).get();
    final querySnapshot = await FirebaseFirestore.instance
        .collection('counter')
        .where('ukey', isEqualTo: 'Zc46be3BLL4nniTDk72R')
        .get();
    for (var doc in querySnapshot.docs) {
      // Getting data directly
      FinalCount = doc.get('final_total');
    }
    return 1;
  }

  void saveToken(String token) async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .update({"token": token});
  }

  void getUserFromDBUser() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser!.email.toString())
        .get();

    for (var doc in querySnapshot.docs) {
      // Getting data directly
      Name = doc.get('fname');
      BirthDate = doc.get('birthDate');
      token = doc.get('token');
      dd = int.parse(BirthDate[0] + BirthDate[1]);
      mm = int.parse(BirthDate[3] + BirthDate[4]);
      yyyy =
          int.parse(BirthDate[6] + BirthDate[7] + BirthDate[8] + BirthDate[9]);
      if (!notificationScheduled) {
        NotificationService().showNotification(
          Name, //title
          "title",
          yyyy,
          mm,
          dd,
        ); //description
        notificationScheduled = true;
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    requestPermission();
    initInfo();
    getToken();
    super.initState();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  initInfo() {
    var androidInitialize =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: androidInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'Greener',
        'greener',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
      );
      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: message.data['body']);
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserFromDBUser();
    getPlan();
    Color color = Colors.green.shade100;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Greenity Citizen", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.green.shade100,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black,),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notifications(
                        // payload: 'Notification',
                      ),
                    ))
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.green,
                        spreadRadius: 1,
                        blurRadius: 1,
                      ),
                    ],
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  width: width * 0.96,
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade100,
                    elevation: 18,
                    shadowColor: Colors.black,
                    child: Center(
                        child: Text(
                          "Hey, Welcome $Name",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        )),
                  )),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: width * 0.96,
                      child: PhysicalModel(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                        elevation: 18,
                        shadowColor: Colors.black,
                        child: const Center(
                            child: Text(
                              "Become a Land Donetor...",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            )),
                      )),
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Add_Slot_Ct()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.green,
                        spreadRadius: 1,
                        blurRadius: 1,
                      ),
                    ],
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 180,
                  width: width - 16,
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade100,
                    elevation: 18,
                    shadowColor: Colors.black,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 150,
                          height: 150,
                          child:
                          Image(image: AssetImage("img/tree_PNG104381.png")),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Text(
                              "$FinalCount",
                              style: const TextStyle(
                                  color: Color(0xff005703),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Total Planted Trees",
                              style: TextStyle(
                                color: Color(0xff005703),
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // color: Colors.green,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 100,
                        width: 220,
                        child: PhysicalModel(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade100,
                          elevation: 18,
                          shadowColor: Colors.black,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '20.95%',
                                  style: TextStyle(
                                      color: Color(0xff005703),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Oxygen in Air',
                                  style: TextStyle(
                                      color: Color(0xff005703),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // color: Colors.green,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 100,
                        width: 220,
                        child: PhysicalModel(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade100,
                          elevation: 18,
                          shadowColor: Colors.black,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '0.04%',
                                  style: TextStyle(
                                      color: Color(0xff005703),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Carbon Dioxide in Air',
                                  style: TextStyle(
                                      color: Color(0xff005703),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                  height: height * 0.35,
                  width: width - 16,
                  child: Stack(
                    children: const <Widget>[
                      GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target:
                              LatLng(8.85577417427599, 38.81151398296511),
                              zoom: 15))
                    ],
                  ),
                  // color: Colors.green,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Our Sponsore',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green[900]),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Sponsor(
                        "UTU",
                        "https://estudentbook.com/admin/img/institute_images/1553083123-UKA%20Tarsadia%20University.jpg",
                        context),
                    Sponsor(
                        "CGPIT",
                        "https://media.licdn.com/dms/image/C510BAQHYuuGlLsckbw/company-logo_200_200/0/1582726030564?e=2147483647&v=beta&t=LGFCcFpv49BaPF3vIGlTz3gO60aMMR-nWK14AtJZruo",
                        context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Sponsor(String name, String img, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.green,
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 133,
      width: 120,
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade100,
        elevation: 18,
        shadowColor: Colors.black,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(40), // Image radius
                  child: Image.network(img, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff005703),
              ),
            ),
          ],
        ),
      ),
      // color: Colors.green,
    ),
  );
}