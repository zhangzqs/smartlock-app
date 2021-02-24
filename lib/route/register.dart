import 'package:flutter/material.dart';

class RegisterRoute extends StatefulWidget {
  @override
  _RegisterRouteState createState() => _RegisterRouteState();
}

class _RegisterRouteState extends State<RegisterRoute> {
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
      appBar: AppBar(title: Text('用户注册')),
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
//密码文本框
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: '再输入一次密码',
                    hintText: '再输入一次密码',
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
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: '请输入手机号码',
                    hintText: '请输入手机号码',
                    prefixIcon: Icon(Icons.phone),
                    suffixIcon: IconButton(
                      icon: Container(
                        child: Text(
                          '获取验证码',
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            )),
                      ),
                      constraints:
                          BoxConstraints.expand(width: 100, height: 50),
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

              //注册按钮
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    //color: Theme.of(context).primaryColor,
                    onPressed: _onRegister,
                    child: Text('注册新帐号'),
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
    print('Register');
  }
}
