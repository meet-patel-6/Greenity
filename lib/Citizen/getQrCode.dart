// ignore_for_file: camel_case_types, deprecated_member_use

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';

import 'package:share_plus/share_plus.dart';

class Get_QR_Code extends StatefulWidget {
  const Get_QR_Code({Key? key, required this.tid}) : super(key: key);
  final String tid;

  @override
  State<Get_QR_Code> createState() => _Get_QR_CodeState();
}

class _Get_QR_CodeState extends State<Get_QR_Code> {
  final controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text('QR-Code', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green[100],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildQR(),
            SizedBox(
              height: h * 0.15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () async {
                  final image = await controller.captureFromWidget(buildQR());
                  saveAndShare(image);

                  Fluttertoast.showToast(
                      msg: "Download Done",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: const Text(
                  "Download QR-Code",
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
    );
  }

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    const text = 'Shared From Greener';
    await Share.shareFiles([image.path], text: text);
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'Greener_QR-Code_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'Greener_QR_Code_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  Widget buildQR() => Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: QrImage(
              data: widget.tid,
              size: 200,
              backgroundColor: Colors.white,
              foregroundColor: Colors.green[700],
            ),
          ),
        ],
      );
}
