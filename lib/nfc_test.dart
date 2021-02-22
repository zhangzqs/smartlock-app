import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcTest extends StatefulWidget {
  @override
  _NfcTestState createState() => _NfcTestState();
}

void nfcTest() async {
  bool isAvailable = await NfcManager.instance.isAvailable();
  print(isAvailable ? 'NFC is Available' : 'Not Available');
  if (isAvailable) {
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        var data = tag.data;
        print(data.keys);
        Uint8List uid;
        for (var key in data.keys) {
          print(data[key]);
          if (data[key] is Map) {
            print('Map');
            Map m = data[key];
            if (m.containsKey('identifier')) {
              uid = m['identifier'];
              break;
            }
          }
        }

        var hex = '';
        uid.forEach((element) {
          hex += '${element.toRadixString(16)}';
        });
        print(hex);
      },
    );
  }
}

class _NfcTestState extends State<NfcTest> {
  bool isAvailable = false;
  _NfcTestState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFC'),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: nfcTest,
              child: Text(isAvailable ? 'Detected' : 'NotSupport'),
            ),
          ],
        ),
      ),
    );
  }
}
