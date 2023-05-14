import 'package:greener_v1/controllers/auth_controller.dart';
import 'package:greener_v1/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forgot_pass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFE7ECEF);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool isLoading = false;
    Offset distance = const Offset(28, 28);
    double blur = 30.0;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Greenity",
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "A unity who makes India Greener",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.green[600],
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "E-mail:",
                        style:
                            TextStyle(
                              fontSize: 25, 
                              color: Colors.green[600],
                              fontWeight: FontWeight.bold
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:  [
                        BoxShadow(
                          blurRadius: blur,
                          offset: -distance,
                          color: Colors.white,
                        ),
                        BoxShadow(
                          blurRadius: blur,
                          offset: distance,
                          color: const Color(0xFFA7A9AF)
                        ),
                      ],
                    ),
                    child: PhysicalModel(
                      borderRadius: BorderRadius.circular(30),
                      color: backgroundColor,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "xyz@gmail.com",
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.green),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.green, width: 1.0)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.white, width: 0)
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))
                            ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        "Password:",
                        style:
                            TextStyle(
                              fontSize: 25, 
                              color: Colors.green[600],
                              fontWeight: FontWeight.bold
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:  [
                        BoxShadow(
                          blurRadius: blur,
                          offset: -distance,
                          color: Colors.white,
                        ),
                        BoxShadow(
                          blurRadius: blur,
                          offset: distance,
                          color: const Color(0xFFA7A9AF)
                        ),
                      ],
                    ),
                    child: PhysicalModel(
                      borderRadius: BorderRadius.circular(30),
                      color: backgroundColor,
                      child: TextField(
                        controller: passwordController,
                        obscureText: !_isVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.green,
                                  ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                              color: Colors.green, width: 1.0
                            )
                          ),
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.lock, color: Colors.green),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white, width: 0
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      RichText(
                          text: TextSpan(
                        text: "Forgot Password?",
                        style:
                            TextStyle(color: Colors.green[600], fontSize: 20),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => const Forgot_Pass()),
                      ))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
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
                      offset: -distance,
                      color: Colors.white,
                    ),
                    BoxShadow(
                      blurRadius: blur,
                      offset: distance,
                      color: const Color(0xFFA7A9AF)
                    ),
                  ],
                ),

                // elevated button created and given style
                // and decoration properties
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: const StadiumBorder(),
                      ),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    AuthController.instance.login(emailController.text.trim(),
                        passwordController.text.trim());

                    // we had used future delayed to stop loading after
                    // 3 seconds and show text "submit" on the screen.
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  child: isLoading
                      // ignore: dead_code
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
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                )),
            SizedBox(height: h - 800),
            RichText(
              text: TextSpan(
                text: "Don't Have an Account? ",
                style: TextStyle(color: Colors.green[600], fontSize: 20),
                children: [
                  TextSpan(
                    text: "Create",
                    style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => const SignUpPage()),
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}