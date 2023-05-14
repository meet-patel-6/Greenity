// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './hamburger.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker picker = ImagePicker();
  XFile? file;
  String imageUrl = '';
  String fname = "a";
  String lname = "a";
  String email = "a";
  String birthDate = "a";
  String role = "a";
  var mno;

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
      birthDate = vari.data()!['birthDate'];
      role = vari.data()!['role'];
      mno = vari.data()!['mobile'].toString();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.green.shade100,
        title: const Text(
          "Greenity",
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),

      drawer: const HamBurger(),

      //body
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              // color: Colors.green[200],
              child: Center(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 150,
                            width: 150,
                            color: Colors.black12,
                            child: imageUrl == ''
                                ? const Icon(
                                    Icons.image,
                                    size: 40,
                                  )
                                : SizedBox(
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                ),
                              ],
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: InkWell(
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomSheet()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "$fname $lname",
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          thickness: 3,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Icon(
                                  Icons.email,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                Text(
                                  ' E-mail ID: $email',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.phone,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                Text(
                                  ' Mobile Number: $mno',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.calendar_month,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                // Text("  "),
                                // Text("  "),
                                Text(
                                  ' Birth Date: $birthDate',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.person,
                                  color: Colors.black54,
                                  size: 20,
                                ),
                                Text(
                                  ' Role: $role',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                icon: const Icon(Icons.camera),
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();

                  file =
                      await imagePicker.pickImage(source: ImageSource.camera);

                  setState(() {});
                  if (file == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please upload an image')));

                    return;
                  }

                  String uniqueFileName =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  FirebaseAuth auth = FirebaseAuth.instance;
                  String? mail = auth.currentUser!.email;
                  Reference referenceDirImages =
                      referenceRoot.child(mail.toString());

                  Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);
                  try {
                    //Store the file
                    await referenceImageToUpload.putFile(File(file!.path));
                    //Success: get the download URL
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(auth.currentUser!.uid)
                        .update({'profile-image': imageUrl});
                    setState(() {});
                  } catch (error) {
                    if (kDebugMode) {
                      print("Some error occurred");
                    }
                  }
                },
                label: const Text("Camera"),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                icon: const Icon(Icons.image),
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();

                  file =
                      await imagePicker.pickImage(source: ImageSource.gallery);

                  setState(() {});
                  if (file == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please upload an image')));

                    return;
                  }

                  String uniqueFileName =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  FirebaseAuth auth = FirebaseAuth.instance;
                  String? mail = auth.currentUser!.email;
                  Reference referenceDirImages =
                      referenceRoot.child(mail.toString());

                  Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);
                  try {
                    //Store the file
                    await referenceImageToUpload.putFile(File(file!.path));
                    //Success: get the download URL
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(auth.currentUser!.uid)
                        .update({'profile-image': imageUrl});
                    setState(() {});
                  } catch (error) {
                    if (kDebugMode) {
                      print("Some error occurred");
                    }
                  }
                },
                label: const Text("Gallery"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
