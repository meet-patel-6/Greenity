// // ignore_for_file: library_private_types_in_public_api
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// class ImagePick extends StatefulWidget {
//   const ImagePick({super.key});
//
//   @override
//   _ImagePickState createState() => _ImagePickState();
// }
//
// class _ImagePickState extends State<ImagePick> {
//   ImagePicker picker = ImagePicker();
//   XFile? image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[200],
//       appBar: AppBar(
//           title: const Text("Image Picker"),
//           backgroundColor: Colors.green[900]),
//       body: Container(
//         padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//         alignment: Alignment.topCenter,
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () async {
//                   image = await picker.pickImage(source: ImageSource.gallery);
//                   setState(() {
//                     //update UI
//                   });
//                 },
//                 child: const Text("Pick Image")),
//             image == null ? Container() : Image.file(File(image!.path))
//           ],
//         ),
//       ),
//     );
//   }
// }
