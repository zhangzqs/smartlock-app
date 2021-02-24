import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smartlock_app/common/lock_server.dart';
import 'package:smartlock_app/common/util.dart';
import 'package:smartlock_app/models/device.dart';

class DeviceListView extends StatefulWidget {
  @override
  _DeviceListViewState createState() => _DeviceListViewState();
}

class _DeviceListViewState extends State<DeviceListView> {
  Widget contentView = Column(
    children: [
      Text('你的设备空空如也'),
      Text('请点击右下方按钮进入添加设备向导'),
      Text('或通过右上方扫描二维码来注册一台设备'),
    ],
    //crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
  );

  @override
  void initState() {
    super.initState();
    var place = ['社团', '宿舍', '家里', '我', '测试'];

    String a() {
      StringBuffer sb = StringBuffer();
      List.generate(6, (index) {
        return Random.secure().nextInt(255);
      }).map((e) {
        String hex = e.toRadixString(16);
        hex = hex.toUpperCase();
        hex = hex.length == 1 ? '0$hex' : hex;
        return hex;
      }).forEach((e) {
        sb.write(e);
      });
      return sb.toString(); //sb.toString();
    }

    contentView = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.lock),
          trailing: Icon(Icons.chevron_right),
          title: Text('SmartLock-${a()}'),
          subtitle:
              Text(place[Random.secure().nextInt(place.length - 1)] + '的门锁'),
          onTap: () {
            showToast('asa');
          },
        );
      },
    );
    // showLoading(context, '正在加载');
    // LockServer.getUserDevices().then((List<UserDevice> devices) {
    //   if (devices.isNotEmpty) {
    //     contentView = ListView(
    //       children: devices
    //           .map((userDevice) => ListTile(
    //               leading: Icon(Icons.lock),
    //               trailing: Icon(Icons.chevron_right),
    //               title: Text(userDevice.deviceId),
    //               subtitle: Text('假装是备注'),
    //               onTap: () {
    //                 showToast('asa');
    //               }))
    //           .toList(),
    //     );
    //     setState(() {});
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: contentView,
      alignment: Alignment.center,
    );
  }
}
