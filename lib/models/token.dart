class _Base {
  String userName = '';
  String info = '';
  DateTime beginTime = DateTime.now();
  DateTime endTime = DateTime.now();

  _Base(Map obj) {
    userName = obj['user_name'];
    info = obj['info'];
    beginTime = DateTime.fromMillisecondsSinceEpoch(obj['begin_time'] * 1000);
    endTime = DateTime.fromMillisecondsSinceEpoch(obj['end_time'] * 1000);
  }

  toMap() {
    return {
      'user_name': userName,
      'info': info,
      'begin_time': beginTime.millisecondsSinceEpoch ~/ 1000,
      'end_time': endTime.millisecondsSinceEpoch ~/ 1000,
    };
  }
}

class Card extends _Base {
  String uid;
  Card(Map map) : super(map) {
    uid = map['uid'];
  }

  @override
  toMap() {
    var m = super.toMap();
    m['uid'] = uid;
  }
}

class Token extends _Base {
  String token;
  Token(Map map) : super(map) {
    token = map['token'];
  }

  @override
  toMap() {
    var m = super.toMap();
    m['token'] = token;
  }
}

class Face extends Token {
  Face(Map map) : super(map);
}
