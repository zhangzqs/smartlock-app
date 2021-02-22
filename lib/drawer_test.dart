import 'package:flutter/material.dart';
import 'package:smartlock_app/common/global.dart';

class DrawerTestRoute extends StatefulWidget {
  @override
  _DrawerTestRouteState createState() => _DrawerTestRouteState();
}

class _DrawerTestRouteState extends State<DrawerTestRoute> {
  final String headImageUrl =
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580303478532&di=1478f90ea84d8431546853ee4b9b02d6&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F04%2F20151104140542_tBusS.jpeg';
  final String backgroundImageUrl =
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3138597732,1722388446&fm=26&gp=0.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('侧划'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('${Global.userName}'),
              accountEmail: Text('2428698039@qq.com'),
              currentAccountPicture: GestureDetector(
                onTap: () => print('点击事件'),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(headImageUrl),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: TextButton(
                child: Text('我的设备'),
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {
                  print('Hello');
                },
              ),
              leading: Icon(Icons.lock),
            ),
            ListTile(
              title: Text('我的账户'),
              leading: Icon(Icons.account_box),
            ),
            ListTile(
              title: Text('我的好友'),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text('更多发现'),
              leading: Icon(Icons.search),
            ),
          ], //List.generate(20, (index) => Text('Test$index')),
        ),
      ),
    );
  }
}
