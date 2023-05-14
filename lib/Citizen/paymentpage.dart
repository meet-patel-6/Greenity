import 'package:flutter/material.dart';
import 'paymentdone.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentHome extends StatefulWidget {
  const PaymentHome({Key? key}) : super(key: key);

  @override
  State<PaymentHome> createState() => _PaymentHomeState();
}

class _PaymentHomeState extends State<PaymentHome> {
  final TextEditingController _controller = TextEditingController();

  late Razorpay _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment "),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 5,
                          color: Colors.green,
                        ))),
              ),
              ElevatedButton(
                  onPressed: () {
                    openCheckout();
                  },
                  child: const Text("Paynow"))
            ],
          ),
        ),
      ),
    );
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_AAQRdWkOg56rB1',
      'amount':
          (double.parse(_controller.text) * 100.roundToDouble()).toString(),
      'name': 'Dharmik kachhadiya',
      'description': 'Pipal tree',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      // debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text("SUCCESS: ${response.paymentId}")));
    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId}", timeInSecForIosWeb: 4);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DonePayment()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text("ERROR: " + response.code.toString() + " - " + response.message)));
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message, timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text("EXTERNAL_WALLET: ${response.walletName}")));
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName}", timeInSecForIosWeb: 4);
  }
}
