import 'package:flutter/material.dart';
import 'package:smartlock_app/common/global.dart';
import 'package:smartlock_app/common/lock_server.dart';
import 'package:smartlock_app/common/util.dart';
import 'package:smartlock_app/models/device.dart';
import 'package:smartlock_app/route/login.dart';
import 'package:smartlock_app/route/qr_scanner.dart';
import 'package:smartlock_app/widgets/device_list.dart';

class DrawerTestRoute extends StatefulWidget {
  @override
  _DrawerTestRouteState createState() => _DrawerTestRouteState();
}

class _DrawerTestRouteState extends State<DrawerTestRoute> {
  final String headImageUrl =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580303478532&di=1478f90ea84d8431546853ee4b9b02d6&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F04%2F20151104140542_tBusS.jpeg';
  final String backgroundImageUrl =
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3138597732,1722388446&fm=26&gp=0.jpg';

  buildDrawerMenu(Widget icon, String text, void Function() callback) {
    return ListTile(
      title: TextButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
        ),
        onPressed: callback,
      ),
      leading: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的设备'),
        actions: [
          IconButton(
              icon: Icon(Icons.qr_code_scanner),
              onPressed: () async {
                showToast('二维码扫描');
                String result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return QRScanRoute();
                }));
                var bindDeviceUrlPrefix = LockServer.baseUrl + '/device/';
                if (!result.startsWith(bindDeviceUrlPrefix)) {
                  //非绑定设备地址
                  showToast('扫码结果：$result');
                  return;
                }
                var deviceId =
                    result.substring(bindDeviceUrlPrefix.length).split('/');

                //本站网址
                showToast('扫描结果: $deviceId');
              }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: TextButton(
                child: Text(
                  Global.userName == null ? '请先点击此处登录' : Global.userName,
                  style: TextStyle(
                    color: Colors.blue[50],
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginRoute();
                  }));
                },
              ),
              accountName: Text(''),
              currentAccountPicture: GestureDetector(
                onTap: () => showToast('暂不支持更换头像'),
                child: CircleAvatar(
                  child: Global.userName == null
                      ? Icon(Icons.person)
                      : Image.network(headImageUrl),
                  backgroundColor: Colors.blue[50],
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildDrawerMenu(Icon(Icons.account_box), '我的账户', () {
              showToast('暂不支持');
            }),
            buildDrawerMenu(Icon(Icons.lock), '我的设备', () {
              showToast('暂不支持');
            }),
            buildDrawerMenu(Icon(Icons.people), '我的好友', () {
              showToast('暂不支持');
            }),
            buildDrawerMenu(Icon(Icons.search), '更多发现', () {
              showToast('暂不支持');
            }),
          ], //List.generate(20, (index) => Text('Test$index')),
        ),
      ),
      body: Global.userName == null
          ? Container(
              child: Text(
                '请先侧划进入登录流程',
              ),
              alignment: Alignment.center,
            )
          : DeviceListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          showToast('暂不支持该方式添加设备，请扫二维码');
          // await LockServer.addUserDevice(UserDevice(
          //   deviceId: 'my_device',
          //   isAdmin: true,
          //   userName: '123',
          // ));
          // print(await LockServer.getUserDevices());
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       var deviceIdController = TextEditingController();

          //       return Container(
          //         child: Form(
          //             child: Column(
          //           children: [
          //             TextFormField(),
          //           ],
          //         )),
          //       );
          //     });
        },
      ),
    );
  }
}
