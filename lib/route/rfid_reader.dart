import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

//门卡检测UI模块

class RfidReaderRoute extends StatefulWidget {
  @override
  _RfidReaderRouteState createState() => _RfidReaderRouteState();
}

class _RfidReaderRouteState extends State<RfidReaderRoute> {
  void rfidDetect() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    print(isAvailable ? 'NFC is Available' : 'Not Available');

    if (isAvailable) {
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          var data = tag.data;
          Uint8List uid;

          for (var key in data.keys) {
            if (data[key] is Map) {
              Map m = data[key];
              if (m.containsKey('identifier')) {
                uid = m['identifier'];
                break;
              }
            }
          }
          StringBuffer sb = StringBuffer();

          uid.forEach((b) {
            sb.write(b.toRadixString(16));
          });

          Navigator.pop(context, sb.toString());
        },
      );
    }
  }

  @override
  initState() {
    super.initState();
    rfidDetect();
    print('开始检测卡片');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '检测实体门卡',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                '请将门卡贴于手机背面NFC天线处进行检测',
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                '检测时请不要移动卡片',
                textAlign: TextAlign.center,
              ),
            ),
            Image.network(
              'https://img.imgdb.cn/item/602aa1853ffa7d37b3754eed.png',
            ),
            TextButton(
              onPressed: () {},
              child: Text('手机无法刷卡？点击此处'),
            ),
          ],
        ),
      ),
    );
  }
}
