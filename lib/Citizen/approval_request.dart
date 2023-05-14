// ignore_for_file: camel_case_types, depend_on_referenced_packages
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Aproval_Request extends StatefulWidget {
  const Aproval_Request({Key? key}) : super(key: key);

  @override
  State<Aproval_Request> createState() => _Aproval_RequestState();
}

class _Aproval_RequestState extends State<Aproval_Request> {
  var accepted = FirebaseDatabase.instance.ref().child('Accepted');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Accepted');

  Widget listItem({required Map request}) {
    return Container(
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
      margin: const EdgeInsets.all(10),
      // padding: const EdgeInsets.all(8),
      height: 100,
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade100,
        elevation: 18,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Name: ${request['Name']}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () async {
                          reference.child(request['key']).remove();
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
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
                            color: Colors.black),
                      ),
                      Text(
                        request['email'],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Date: ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Text(
                        request['date'].toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text("Approval Requests", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green.shade100,
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: accepted,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map request = snapshot.value as Map;
            request['key'] = snapshot.key;

            return listItem(request: request);
          },
        ),
      ),
    );
  }
}
