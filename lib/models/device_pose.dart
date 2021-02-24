import 'package:smartlock_app/models/base_model.dart';

class DevicePose extends BaseModel {
  double row, pitch, yaw;
  DevicePose({
    Map map,
    this.row = 0,
    this.pitch = 0,
    this.yaw = 0,
  }) {
    if (map != null) {
      row = map['row'];
      pitch = map['pitch'];
      yaw = map['map'];
    }
  }

  @override
  toMap() {
    return {
      'row': row,
      'pitch': pitch,
      'yaw': yaw,
    };
  }
}
