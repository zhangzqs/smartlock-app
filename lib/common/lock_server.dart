import 'package:dio/dio.dart';
import 'package:smartlock_app/common/global.dart';
import 'package:smartlock_app/common/util.dart';
import 'package:smartlock_app/models/control_instruction.dart';
import 'package:smartlock_app/models/device.dart';
import 'package:smartlock_app/models/device_pose.dart';
import 'package:smartlock_app/models/user.dart';

class LockServer {
  static const String baseUrl = 'http://192.168.2.193:8080';

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      contentType: Headers.jsonContentType,
    ),
  );
  static getDevicePose(String deviceId) {
    return controlDevice(deviceId, 'esp', 'get_pose');
  }

  static Future<DevicePose> getNormalDevicePose() {}

  static Future<List<UserDevice>> getUserDevices() async {
    var response = await dio.get(
      '/user/device',
      queryParameters: {
        'user_name': Global.userName,
      },
    );
    List data = response.data;
    var result = <UserDevice>[];
    data.forEach((m) {
      result.add(UserDevice(map: m));
    });
    return result;
  }

  // 绑定一台设备
  static addUserDevice(UserDevice userDevice) async {
    var response = await dio.post(
      '/user/device',
      data: userDevice.toMap(),
    );
    showToast(response.data);
  }

  // 检查设备是否在线
  static isDeviceOnline(String deviceId) async {
    var response = await dio.post(
      '/device/$deviceId',
      data: '',
    );
    if (response.data == '设备离线') {
      return false;
    }
    return true;
  }

  static controlDevice(String deviceId, String dist, String instruction) async {
    var response = await dio.post(
      '/device/$deviceId',
      data: ControlInstruction(
        userName: Global.userName,
        dist: dist,
        instruction: instruction,
      ).toMap(),
    );
    return response.data;
  }

  static unlock(String deviceId) {
    controlDevice(deviceId, 'servo', 'unlock');
  }

  static open(String deviceId) {
    controlDevice(deviceId, 'servo', 'open');
  }

  static restart(String deviceId) {
    controlDevice(deviceId, 'esp', 'restart');
  }

  static Future<String> login(String userName, String password) async {
    var response = await dio.post(
      '/login',
      data: {
        'user_name': userName,
        'password': password,
      },
    );

    var code = response.data['code'];
    if (code == 0) {
      Global.setUserName(response.data['user_name']);
      showToast("欢迎回来，${Global.userName}");
      return response.data['user_name'];
    } else {
      showToast("登录失败$code");
      return null;
    }
  }
}
