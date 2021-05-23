import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScann extends StatefulWidget {
  static const valueKey = ValueKey('qrScan');
  final ValueChanged<Map> didSelectedPage;

  QrCodeScann({Key key, this.didSelectedPage});
  @override
  _QrCodeScannState createState() => _QrCodeScannState();
}

class _QrCodeScannState extends State<QrCodeScann> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1400), () {
      setState(() {
        widget.didSelectedPage({
          'page': 'LightCandle',
          'candleID': "12345",
        });
      });
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Poskenira QR kodo"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 350.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          overlayColor: Color.fromRGBO(0, 0, 0, 1),
          borderColor: Colors.white,
          borderRadius: 5,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        widget.didSelectedPage({
          'page': 'LightCandle',
          'candleID': result.code,
        });
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
