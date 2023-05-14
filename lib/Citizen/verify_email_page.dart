import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bottomnav.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 2),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = false);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const Bottom_Nav()
      : Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[100],
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: const Text('Verify Email', style: TextStyle(color: Colors.black),),
          ),
          body: Container(
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      ('A verification mail has been sent to your address. check SPAM folder if you did not find it in inbox'),
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      color: Colors.green,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        icon: const Icon(
                          Icons.email,
                          size: 32,
                        ),
                        label: const Text(
                          'Resend Email',
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          if (canResendEmail) {
                            sendVerificationEmail();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: Text(
                        'Cancel',
                        style:
                            TextStyle(fontSize: 24, color: Colors.green[700]),
                      ),
                      onPressed: () => FirebaseAuth.instance.signOut(),
                    )
                  ],
                )),
          ));
}
