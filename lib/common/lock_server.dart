import 'package:dio/dio.dart';
import 'package:smartlock_app/common/global.dart';
import 'package:smartlock_app/common/util.dart';
import 'package:smartlock_app/models/user.dart';

class LockServer {
  static String baseUrl = 'http://192.168.43.194:8080';

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      contentType: Headers.jsonContentType,
    ),
  );

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

  static Future<User> getUserInfo(String userName) {}
}
