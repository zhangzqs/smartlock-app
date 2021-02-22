import 'package:flutter/material.dart';

class UserModifierRouter extends StatefulWidget {
  @override
  _UserModifierRouterState createState() => _UserModifierRouterState();
}

class _UserModifierRouterState extends State<UserModifierRouter> {
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("修改用户信息"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        // child: Form(
        //   key: ,
        // ),
      ),
    );
  }
}
