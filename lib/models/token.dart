import 'dart:convert';

import 'package:smartlock_app/models/base_model.dart';

class _Base extends BaseModel {
  String userName = '';
  String info = '';
  DateTime beginTime = DateTime.now();
  DateTime endTime;

  _Base({
    Map map,
    this.userName,
    this.info,
    this.beginTime,
    this.endTime,
  }) {
    if (map != null) {
      userName = map['user_name'];
      info = map['info'];
      beginTime = DateTime.fromMillisecondsSinceEpoch(map['begin_time'] * 1000);
      endTime = map['end_time'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(map['end_time'] * 1000);
    }
  }

  @override
  toMap() {
    return {
      'user_name': userName,
      'info': info,
      'begin_time': beginTime.millisecondsSinceEpoch ~/ 1000,
      'end_time': endTime == null ? 0 : endTime.millisecondsSinceEpoch ~/ 1000,
    };
  }
}

class Token extends _Base {
  String token = '';

  Token({
    Map map,
    userName,
    info,
    beginTime,
    endTime,
    this.token,
  }) : super(
          map: map,
          userName: userName,
          info: info,
          beginTime: beginTime,
          endTime: endTime,
        ) {
    if (map != null) {
      this.token = map['token'];
    }
  }
  @override
  toMap() {
    var m = super.toMap();
    m['token'] = token;
    return m;
  }
}

class LockCard extends _Base {
  String uid = '';

  LockCard({
    Map map,
    userName,
    info,
    beginTime,
    endTime,
    this.uid,
  }) : super(
          map: map,
          userName: userName,
          info: info,
          beginTime: beginTime,
          endTime: endTime,
        ) {
    if (map != null) {
      this.uid = map['uid'];
    }
  }
  @override
  toMap() {
    var m = super.toMap();
    m['uid'] = uid;
    return m;
  }
}
