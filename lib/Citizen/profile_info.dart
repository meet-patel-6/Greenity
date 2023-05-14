// // ignore_for_file: library_private_types_in_public_api
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class ProfileInfo extends StatefulWidget {
//   const ProfileInfo({super.key});
//
//   @override
//   _ProfileInfoState createState() => _ProfileInfoState();
// }
//
// class _ProfileInfoState extends State<ProfileInfo> {
//   String fname = "a";
//   String lname = "a";
//   String email = "a";
//   String birthDate = "a";
//   String role = "a";
//   void getData() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance
//         .collection("users")
//         .doc(user?.uid)
//         .get();
//     setState(() {
//       fname = vari.data()!['fname'];
//       lname = vari.data()!['lname'];
//       email = vari.data()!['email'];
//       birthDate = vari.data()!['birthDate'];
//       role = vari.data()!['role'];
//     });
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[200],
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text("Profile"),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Container(
//               width: 100,
//               height: 100,
//               margin: const EdgeInsets.only(
//                 top: 30,
//               ),
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQNvWDvQb_rCtRL-p_w329CtzHmfzfWP0FIw&usqp=CAU'),
//                     fit: BoxFit.fill),
//               ),
//             ),
//             Text(
//               fname,
//               style: const TextStyle(
//                 fontSize: 22,
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//               width: 300,
//               child: Divider(
//                 color: Colors.black,
//               ),
//             ),
//             Container(
//               width: 280,
//               height: 50,
//               margin: const EdgeInsets.only(right: 40),
//               child: Row(
//                 children: <Widget>[
//                   const Icon(Icons.person),
//                   const Text("  "),
//                   const Text(
//                     'First Name : ',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text("  "),
//                   Text(
//                     fname,
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               width: 280,
//               height: 50,
//               margin: const EdgeInsets.only(right: 40),
//               child: Row(
//                 children: <Widget>[
//                   const Icon(Icons.person),
//                   const Text("  "),
//                   const Text("  "),
//                   const Text(
//                     'Last Name : ',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text("  "),
//                   Text(
//                     lname,
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               width: 320,
//               height: 50,
//               margin: const EdgeInsets.only(right: 0, left: 1),
//               child: Row(
//                 children: <Widget>[
//                   const Icon(Icons.email),
//                   const Text("  "),
//                   const Text("  "),
//                   const Text(
//                     'E-mail ID : ',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text("  "),
//                   Text(
//                     email,
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               width: 280,
//               height: 50,
//               margin: const EdgeInsets.only(right: 40),
//               child: Row(
//                 children: <Widget>[
//                   const Icon(Icons.calendar_month),
//                   const Text("  "),
//                   const Text("  "),
//                   const Text(
//                     'Birth Date : ',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text("  "),
//                   Text(
//                     birthDate,
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               width: 280,
//               height: 50,
//               margin: const EdgeInsets.only(right: 40),
//               child: Row(
//                 children: <Widget>[
//                   const Icon(Icons.format_list_bulleted_rounded),
//                   const Text("  "),
//                   const Text("  "),
//                   const Text(
//                     'Role : ',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text("  "),
//                   Text(
//                     role,
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
