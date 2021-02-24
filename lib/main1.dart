import 'package:flutter/material.dart';
import 'package:smartlock_app/common/util.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  static Widget buildIconGridButton(
      IconData iconData, String text, void Function() onPressed) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Colors.grey[200],
      )),
      child: MaterialButton(
        child: Column(
          children: [
            Icon(
              iconData,
              color: Colors.grey[700],
              size: 100,
            ),
            Text('$text'),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('操作门锁'),
      ),
      body: Padding(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text('当前门锁ID：SmartLock-1E0B3F7E9803'),
                    subtitle: Text('备注：社团的门锁'),
                    leading: Icon(Icons.lock),
                  ),
                  // ListTile(
                  //   title: Text('门锁备注'),
                  //   subtitle: Text('社团的门锁'),
                  //   leading: Icon(Icons.comment),
                  // ),
                  ListTile(
                    title: Text('已设置关门时门锁姿态信息'),
                    subtitle: Text('Row:1.32, Pitch:5.68, Yaw:-12.8'),
                    leading: Icon(Icons.gesture),
                    trailing: Icon(Icons.settings),
                    onTap: () {
                      showToast('进入门锁姿态校正');
                    },
                  ),
                  ListTile(
                    title: Text('当前的门锁的姿态信息'),
                    subtitle: Text('Row:1.33, Pitch:5.64, Yaw:-12.5'),
                    leading: Icon(Icons.gesture),
                    trailing: Icon(Icons.refresh),
                    onTap: () {
                      showToast('正在刷新');
                    },
                  ),
                  ListTile(
                    title: Text('程序判定当前门已关闭'),
                    leading: Icon(Icons.check),
                  )
                ],
              ),
              Text(
                '下列按钮将对门锁执行相应的操作: ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: [
                  buildIconGridButton(Icons.lock_open, '正常开锁', () {}),
                  buildIconGridButton(Icons.lock_open, '锁定常开', () {}),
                  buildIconGridButton(Icons.volume_up_outlined, '蜂鸣器发声', () {}),
                  buildIconGridButton(
                      Icons.lightbulb_outline, 'LED状态切换', () {}),
                  buildIconGridButton(Icons.security, '添加口令', () {}),
                  buildIconGridButton(Icons.credit_card, '添加门卡', () {}),
                  buildIconGridButton(Icons.face, '添加人脸', () {}),
                  buildIconGridButton(
                      Icons.camera_alt_outlined, '查看摄像头', () {}),
                  buildIconGridButton(Icons.refresh_outlined, '重启设备', () {}),
                ],
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(2),
      ),
    );
  }
}
