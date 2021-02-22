import 'package:flutter/material.dart';
import 'package:smartlock_app/common/global.dart';
import 'package:smartlock_app/common/util.dart';
import 'package:smartlock_app/widgets/card_reader.dart';

class AddCardRoute extends StatefulWidget {
  String uid;
  AddCardRoute({this.uid});

  @override
  _AddCardRouteState createState() => _AddCardRouteState(uid ?? "");
}

class _AddCardRouteState extends State<AddCardRoute> {
  TextEditingController _infoController = TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();

  String uid; //卡片UID信息
  String info; //卡片备注

  _AddCardRouteState(String uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新卡录入')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              Text('当前用户: ${Global.userName}'),
              CardReader(
                (uid) {
                  //当选择完毕
                  this.uid = uid;
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
                  return v.trim().isNotEmpty ? null : '用户名不能为空';
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    //color: Theme.of(context).primaryColor,
                    onPressed: () {
                      showToast(uid);
                    },
                    child: Text(
                      '登录',
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
