import 'dart:convert';

abstract class BaseModel {
  toMap();
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
