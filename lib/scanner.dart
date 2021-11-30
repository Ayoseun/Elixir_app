import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override
  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
      ),
      body:column(
        child : Container(
          Width(50,50),
           QRView(
        key: qrkey,
        onQRViewCreated: _onQRViewCreated,
      ),
        ),
        
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      if (await canLaunch(scanData.code)) {
        await launch(scanData.code);
        controller.resumeCamera();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('ElixerDome Detect'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Validated by: ${describeEnum(scanData.format)}'),
                    Text('Drughash: ${scanData.code}'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('validate'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        ).then((value) => controller.resumeCamera());
      }
    });
  }
}
