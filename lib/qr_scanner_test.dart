import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

//扫码UI模块

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 7, child: _buildQrView()),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                child: FutureBuilder(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    return ListTile(
                      leading: Icon(
                          snapshot.data ? Icons.flash_off : Icons.flash_on),
                      title: Text(
                        '${snapshot.data ? '关闭' : '打开'}闪光灯',
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView() {
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((Barcode scanData) {
      //扫描结果

      setState(() {
        controller.stopCamera();

        String result = scanData.code;
        Navigator.pop(context, result);
      });
    });
  }
}
