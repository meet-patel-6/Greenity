// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 's_hamburger.dart';

import '../controllers/auth_controller.dart';
import 'Addad.dart';

class Sponsor_Home extends StatefulWidget {
  const Sponsor_Home({Key? key}) : super(key: key);

  @override
  State<Sponsor_Home> createState() => _Sponsor_HomeState();
}

class _Sponsor_HomeState extends State<Sponsor_Home> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var pName = "Watch";
    var adID = 123445;
    var views = 12345;
    var clicks = 123;
    var ammount = 1234;
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: const Text("Greener"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                AuthController.instance.logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      drawer: const S_HamBurger(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Welcome",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Container(
                  height: h * 0.075,
                  width: w * 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green[200],
                  ),
                  child: Column(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Addad()));
                        },
                        child: const Text('List a New Ad'),
                      )
                    ],
                  ),
                ),
                const Text(
                  "Your Ad's",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Container(
                  height: h * 0.29,
                  width: w * 90,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green[300],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Product Name: $pName \nAd ID: $adID \nViews: $views \nClicks: $clicks \nAmmount: $ammount INR",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: const Text('Remove Ad'),
                      )
                    ],
                  ),
                ),
                Container(
                  height: h * 0.29,
                  width: w * 90,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green[300],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Product Name: $pName \nAd ID: $adID \nViews: $views \nClicks: $clicks \nAmmount: $ammount INR",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: const Text('Remove Ad'),
                      )
                    ],
                  ),
                ),
                Container(
                  height: h * 0.29,
                  width: w * 90,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green[300],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Product Name: $pName \nAd ID: $adID \nViews: $views \nClicks: $clicks \nAmmount: $ammount INR",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: const Text('Remove Ad'),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
