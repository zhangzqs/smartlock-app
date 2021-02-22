import 'package:flutter/material.dart';
import 'package:smartlock_app/common/global.dart';
import 'package:smartlock_app/common/util.dart';
import 'package:smartlock_app/widgets/time_picker.dart';

class AddTokenRoute extends StatefulWidget {
  String token;
  AddTokenRoute({this.token});

  @override
  _AddTokenRouteState createState() => _AddTokenRouteState(token ?? "");
}

class _AddTokenRouteState extends State<AddTokenRoute> {
  TextEditingController _tokenController = TextEditingController();
  TextEditingController _infoController = TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();

  String token;
  String info;
  DateTime beginTime = DateTime.now(); //默认有效期从当前时间开始
  DateTime endTime; //默认有效期永久

  _AddTokenRouteState(this.token);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('口令密码录入')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              Text('当前开设口令的管理员用户为: ${Global.userName}'),
              TextFormField(
                controller: _tokenController,
                decoration: InputDecoration(
                  labelText: '口令密码',
                  hintText: '口令密码',
                  prefixIcon: Icon(Icons.security),
                ),
                validator: (v) {
                  return v.trim().isNotEmpty ? null : '口令不能为空';
                },
              ),
              TextFormField(
                controller: _infoController,
                decoration: InputDecoration(
                  labelText: '备注',
                  hintText: '备注',
                  prefixIcon: Icon(Icons.comment),
                ),
                // 校验用户名（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : '备注不能为空';
                },
              ),
              DateTimePicker(
                (DateTime time) {
                  beginTime = time;
                },
                text: "请选择开始时间",
              ),
              DateTimePicker(
                (DateTime time) {
                  endTime = time;
                },
                text: "请选择到期时间",
                content: "默认不选则为永久有效",
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    //color: Theme.of(context).primaryColor,
                    onPressed: () {},
                    child: Text(
                      '开设口令',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
