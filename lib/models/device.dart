// 某个用户的设备绑定信息
import 'dart:convert';

import 'package:smartlock_app/models/base_model.dart';

class UserDevice extends BaseModel {
  String userName;
  String deviceId;
  bool isAdmin;

  UserDevice({
    Map map,
    this.userName = '',
    this.deviceId = '',
    this.isAdmin = true,
  }) {
    if (map != null) {
      userName = map['user_name'];
      deviceId = map['device_id'];
      isAdmin = map['admin'] == 'admin';
    }
  }

  @override
  toMap() {
    return {
      'user_name': userName,
      'device_id': deviceId,
      'admin': isAdmin ? 'admin' : 'common',
    };
  }
}
