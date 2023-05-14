import 'package:flutter/material.dart';

class DonePayment extends StatefulWidget {
  const DonePayment({Key? key}) : super(key: key);

  @override
  State<DonePayment> createState() => _DonePaymentState();
}

class _DonePaymentState extends State<DonePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Done"),
      ),
      body: Column(children: [
        const Text(
          "Done Payment",
          style: TextStyle(
            fontSize: 30,
            color: Colors.green,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 5,
                        color: Colors.white,
                      )));
            },
            child: const Text("Download PDF"))
      ]),
    );
  }
}
