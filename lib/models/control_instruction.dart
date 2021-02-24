import 'package:smartlock_app/models/base_model.dart';

class ControlInstruction extends BaseModel {
  String userName; //操作者的用户名
  String dist; //控制目标
  String instruction; //指令内容
  ControlInstruction({
    Map map,
    this.userName,
    this.dist,
    this.instruction,
  }) {
    if (map != null) {
      userName = map['user_name'];
      dist = map['dist'];
      instruction = map['instruction'];
    }
  }
  @override
  toMap() {
    return {
      'user_name': userName,
      'dist': dist,
      'instruction': instruction,
    };
  }
}
