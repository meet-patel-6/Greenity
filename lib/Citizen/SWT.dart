// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, use_build_context_synchronously, deprecated_member_use

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:greener_v1/Citizen/getQrCode.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';

import 'package:share_plus/share_plus.dart';

class SWT extends StatefulWidget {
  const SWT({Key? key}) : super(key: key);

  @override
  State<SWT> createState() => SWTState();
}

class SWTState extends State<SWT> {
  List<String> items = [
    "Birthday",
    "Marriage Anniversary",
    "Get 1st Job",
  ];
  String? selectedItem = 'Birthday';

  String location = 'Lat: ... , Long: ...';
  String Address = 'search';
  String imageUrl = '';
  bool isLoading = false;
  var file;

  final CollectionReference notif =
      FirebaseFirestore.instance.collection('place otp');

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  String? uid = '';
  String Name = '';
  String PName = '';
  String Lname = '';
  String FullName = "";
  String mo = '';
  int FinalCount = 0;

  void getUserFromDBUser() async {
    //return FirebaseFirestore.instance.collection('users').doc(userId).get();
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser!.email.toString())
        .get();

    for (var doc in querySnapshot.docs) {
      // Getting data directly
      uid = doc.id;
      Name = doc.get('fname');
      Lname = doc.get('lname');
      mo = doc.get('mobile').toString();
    }
    setState(() {});
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

  void get_key(String thisId) async {
    //return FirebaseFirestore.instance.collection('users').doc(userId).get();
    PName = '';
    final querySnapshot = await FirebaseFirestore.instance
        .collection('place otp')
        .where('id', isEqualTo: thisId)
        .get();

    for (var doc in querySnapshot.docs) {
      // Getting data directly
      PName = "* " + doc.get('place');
    }
    setState(() {});
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getFullName();
    getPlan();
    Locationi();
  }

  void Locationi() async {
    Position position = await getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    GetAddressFromLatLong(position);
    setState(() {});
  }

  void getFullName() {
    getUserFromDBUser();
    setState(() {
      FullName = '$Name $Lname';
    });
  }

  final controller = ScreenshotController();

  late String key, tname, about, place;

  CollectionReference users = FirebaseFirestore.instance.collection('scanner');
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    getUserFromDBUser();
    getFullName();
    getPlan();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Screenshot(
      controller: controller,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green.shade100,
          title: const Text("Selfie With Tree", style: TextStyle(color: Colors.black),),
        ),
        body: SizedBox(
          height: h,
          width: w,
          // color: Colors.green[200],
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Plantation Key:",
                        style:
                            TextStyle(fontSize: 20, color: Colors.green[700]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: PhysicalModel(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      elevation: 18,
                      shadowColor: Colors.black,
                      child: TextField(
                        onChanged: (value) {
                          key = value;
                          get_key(key);
                          if (PName == "") {
                            PName = "* Invalid Key";
                          }
                        },
                        // controller: fnameController,
                        decoration: InputDecoration(
                            hintText: "Enter Plantation Key",
                            // prefixIcon: Icon(Icons.nam, color:Colors.green),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "  $PName",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Tree Name:",
                        style:
                            TextStyle(fontSize: 20, color: Colors.green[700]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: PhysicalModel(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      elevation: 18,
                      shadowColor: Colors.black,
                      child: TextField(
                        onChanged: (value) {
                          tname = value;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Your Tree Name",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Celebration :",
                        style:
                            TextStyle(fontSize: 20, color: Colors.green[700]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    margin: const EdgeInsets.only(top: 5, left: 3),
                    child: PhysicalModel(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      elevation: 18,
                      shadowColor: Colors.black,
                      child: SizedBox(
                          width: w * 0.99,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0)),
                            ),
                            value: selectedItem,
                            items: items
                                .map((item) => DropdownMenuItem(
                                    value: item, child: Text(item)))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedItem = item),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "About Celebration:",
                        style:
                            TextStyle(fontSize: 20, color: Colors.green[700]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: PhysicalModel(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      elevation: 18,
                      shadowColor: Colors.black,
                      child: TextField(
                        onChanged: (value) {
                          about = value;
                        },
                        // controller: fnameController,
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: "Write About Celebration",
                            // prefixIcon: Icon(Icons.nam, color:Colors.green),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Upload Your Selfie With Tree :",
                        style:
                            TextStyle(fontSize: 20, color: Colors.green[700]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 180,
                        width: 200,
                        color: Colors.black12,
                        child: file == null
                            ? const Icon(
                                Icons.image,
                                size: 40,
                              )
                            : Image.file(
                                File(file!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            height: 50,
                            minWidth: 140,
                            onPressed: () async {
                              ImagePicker imagePicker = ImagePicker();
                              file = await imagePicker.pickImage(
                                  source: ImageSource.camera);
                              setState(() {});
                              if (file == null) return;
                            },
                            color: Colors.green,
                            child: const Text(
                              "take Selfie",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            height: 50,
                            minWidth: 140,
                            onPressed: () {
                              file = null;
                              setState(() {});
                            },
                            color: Colors.red[300],
                            child: const Text(
                              "Remove Selfie",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Coordinates Points",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          location,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'ADDRESS',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(Address),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 60,
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          if (file == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please upload an image')));
                            isLoading = false;
                            return;
                          }
                          if (Address == 'search') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Please select location.')));
                            isLoading = false;
                            return;
                          }

                          String uniqueFileName = DateTime.now()
                              .millisecondsSinceEpoch
                              .toString();
                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          FirebaseAuth auth = FirebaseAuth.instance;
                          String? mail = auth.currentUser!.email;
                          // String? fname = auth.currentUser!.fname;
                          Reference referenceDirImages =
                              referenceRoot.child(mail.toString());

                          Reference referenceImageToUpload =
                              referenceDirImages.child(uniqueFileName);
                          try {
                            String datetime = DateTime.now().toString();
                            //Store the file
                            await referenceImageToUpload
                                .putFile(File(file!.path));
                            //Success: get the download URL
                            imageUrl =
                                await referenceImageToUpload.getDownloadURL();
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(auth.currentUser!.uid)
                                .update({
                              'imageData': FieldValue.arrayUnion([
                                {
                                  'selfie': {
                                    'image': imageUrl,
                                    'coordinates': location,
                                    'address': Address,
                                  },
                                },
                              ]),
                            });
                            await getPlan();
                            FirebaseFirestore.instance
                                .collection('counter')
                                .doc('Zc46be3BLL4nniTDk72R')
                                .update({'final_total': FinalCount + 1});
                            // print(FinalCount + 1);

                            FirebaseFirestore.instance
                                .collection('scanner')
                                .doc(datetime)
                                .set({
                              'Name': FullName,
                              'Tree_Name': tname,
                              'Celebration': selectedItem,
                              'About_Celebration': about,
                              'Image_Url': imageUrl,
                              'Coordinates': location,
                              'Address': Address,
                              'Email': auth.currentUser!.email.toString(),
                            });

                            // String did = mo + datetime;

                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                isLoading = false;
                              });
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Get_QR_Code(
                                          tid: datetime,
                                        )));
                          } catch (error) {
                            isLoading = false;
                          }
                        },
                        child: isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                // as elevated button gets clicked we will see text"Loading..."
                                // on the screen with circular progress indicator white in color.
                                //as loading gets stopped "Submit" will be displayed
                                children: const [
                                  Text(
                                    'Loading...',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            : const Text(
                                'Get QR-Code',
                                style: TextStyle(fontSize: 20),
                              ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    const text = 'Shared From Greener';
    await Share.shareFiles([image.path], text: text);
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'Greener_QR-Code_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'Greener_QR_Code_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  Widget buildQR() => Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: QrImage(
              data: 'Nikunj Sonigara',
              size: 200,
              // backgroundColor: Colors.black,
              foregroundColor: Colors.green,
            ),
          ),
        ],
      );

  Future<bool> isDE(String docName) async {
    DocumentSnapshot<Map<String, dynamic>> document = await FirebaseFirestore
        .instance
        .collection("place otp")
        .doc(docName)
        .get();

    if (document.exists) {
      return true;
    } else {
      return false;
    }
  }
}
