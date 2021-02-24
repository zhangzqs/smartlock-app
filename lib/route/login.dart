import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartlock_app/common/lock_server.dart';
import 'package:smartlock_app/route/register.dart';
import '../common/util.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false; //是否显示密码,默认隐藏密码

  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = null; //Global.profile.lastLogin;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('用户登录')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              //用户名文本框
              TextFormField(
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名',
                  prefixIcon: Icon(Icons.person),
                ),
                // 校验用户名（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : '用户名不能为空';
                },
              ),

              //密码文本框
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '密码',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow, //是否隐藏密码
                //校验密码（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : '密码不能为空';
                },
              ),

              //登录按钮
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    //color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    child: Text(
                      '登录',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),

              //注册按钮
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    //color: Theme.of(context).primaryColor,
                    onPressed: _onRegister,
                    child: Text(
                      '注册新帐号',
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

  void _onRegister() async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return RegisterRoute();
      },
    ));
  }

  void _onLogin() async {
    //showLoading(context, "正在登录");
    await LockServer.login(
      _unameController.text,
      _pwdController.text,
    );
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
//   void _onLogin() async {
//     // 先验证各个表单字段是否合法
//     if ((_formKey.currentState as FormState).validate()) {
//       showLoading(context);
//       User user;
//       try {
//         user = await Git(context)
//             .login(_unameController.text, _pwdController.text);
//         // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
//         Provider.of<UserModel>(context, listen: false).user = user;
//       } catch (e) {
//         //登录失败则提示
//         if (e.response?.statusCode == 401) {
//           showToast(GmLocalizations.of(context).userNameOrPasswordWrong);
//         } else {
//           showToast(e.toString());
//         }
//       } finally {
//         // 隐藏loading框
//         Navigator.of(context).pop();
//       }
//       if (user != null) {
//         // 返回
//         Navigator.of(context).pop();
//       }
//     }
//   }
// }
