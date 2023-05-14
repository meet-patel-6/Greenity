import 'package:flutter/material.dart';
import 'package:greener_v1/sponser/sponsor.dart';
import 'Citizen/citizen.dart';
import 'amc_team_signup.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;

    const backgroundColor = Color(0xFFE7ECEF);
    Offset distance = const Offset(28, 28);
    double blur = 30.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text('Greenity', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: const Offset(8, 8),
                          color: Colors.black38,
                          blurRadius: blur,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                      child: Center(
                        child: Text(
                          "Choose the Entity",
                          style: TextStyle(
                            // backgroundColor: Colors.green[600],
                            fontSize: 35,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(8, 8),
                                color: Colors.black38,
                                blurRadius: 25,
                              )
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(

                    width: 200,
                    height: 60,

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:  [
                        BoxShadow(
                            blurRadius: blur,
                            offset: distance,
                            color: const Color(0xFFA7A9AF)
                        ),
                      ],
                    ),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: const StadiumBorder(),
                      ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Citizen_Signup()));
                        },
                        child: const Text(
                          "Citizen",
                          style: TextStyle(
                            // backgroundColor: Colors.green[600],
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 200,
                    height: 60,

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:  [
                        BoxShadow(
                            blurRadius: blur,
                            offset: distance,
                            color: const Color(0xFFA7A9AF)
                        ),
                      ],
                    ),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Team_Signup()));
                      },
                      child: const Text(
                        "AMC Team",
                        style: TextStyle(
                          // backgroundColor: Colors.green[600],
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(

                    width: 200,
                    height: 60,

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:  [
                        BoxShadow(
                            blurRadius: blur,
                            offset: distance,
                            color: const Color(0xFFA7A9AF)
                        ),
                      ],
                    ),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Sponsor_Signup()));
                      },
                      child: const Text(
                        "Sponsor",
                        style: TextStyle(
                          // backgroundColor: Colors.green[600],
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
