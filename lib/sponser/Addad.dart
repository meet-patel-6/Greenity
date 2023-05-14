// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sponsor_home.dart';
import 'package:image_picker/image_picker.dart';

class Addad extends StatefulWidget {
  const Addad({super.key});

  @override
  _AddadState createState() => _AddadState();
}

class _AddadState extends State<Addad> {
  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      _image = imageTemporary;
    });
  }

  final items = [
    "Government ad",
    "Education ad",
    "Industry ad",
    "Commercial ad"
  ];
  String? value;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(
                  MaterialPageRoute(builder: (context) => (const Addad())));
            },
          ),
          title: const Text('Greener'),
          backgroundColor: Colors.green,
        ),
        body: ListView(children: [
          Container(
            height: 800,
            margin: const EdgeInsets.only(top: 13, left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  const Text(
                    'Add new ad :',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Type of ad :',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: Colors.green, width: 4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      value: items.first,
                      dropdownColor: Colors.green[300],
                      iconSize: 35,
                      icon:
                          Icon(Icons.arrow_drop_down, color: Colors.green[300]),
                      isExpanded: true,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _image != null
                      ? Image.file(
                          _image!,
                          width: 270,
                          height: 240,
                          fit: BoxFit.cover,
                        )
                      : Image.network('https://picsum.photos/536/354'),
                  const SizedBox(height: 15),
                  CustomButton(
                    title: 'Pick from Gellery',
                    icon: Icons.image_outlined,
                    onClick: () => getImage(ImageSource.gallery),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                      title: 'Pick from Camera',
                      icon: Icons.camera,
                      onClick: () => getImage(ImageSource.camera)),
                  const SizedBox(height: 15),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        color: Colors.green,
                        child: InkWell(
                          splashColor: const Color(0xFF80C038).withOpacity(0.2),
                          highlightColor:
                              const Color(0xFF80C038).withOpacity(0.2),
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 4,
                                )),
                            child: const Text(
                              "Send for Authentication",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        color: Colors.green,
                        child: InkWell(
                          splashColor: const Color(0xFF80C038).withOpacity(0.2),
                          highlightColor:
                              const Color(0xFF80C038).withOpacity(0.2),
                          onTap: () {
                            Get.offAll(() => const Sponsor_Home());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 4,
                                )),
                            child: const Text(
                              'Cancel',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Read Terms,Conditions and Pricing :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(children: [
          Icon(icon),
          const SizedBox(
            width: 20,
          ),
          Text(title),
        ]),
      ));
}
