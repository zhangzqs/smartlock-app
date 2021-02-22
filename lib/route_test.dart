import 'package:flutter/material.dart';
import 'dart:math';

class TestRoute extends StatefulWidget {
  final String _test;
  TestRoute(this._test);
  @override
  _TestRouteState createState() => _TestRouteState(_test);
}

class _TestRouteState extends State<TestRoute> {
  final String _test;

  _TestRouteState(this._test);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestRoute'),
      ),
      body: Text('Hello$_test'),
    );
  }
}

class RouteTest extends StatefulWidget {
  @override
  _RouteTestState createState() => _RouteTestState();
}

class _RouteTestState extends State<RouteTest> {
  _RouteTestState() {
    print('RouteTestStart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RouteTest'),
      ),
      body: Container(
        child: ElevatedButton(
          child: Text('Start'),
          onPressed: () async {
            print('Start button clicked');
            var data = await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return TestRoute(Random.secure().nextDouble().toString());
              },
            ));
            print(data);
          },
        ),
      ),
    );
  }
}
