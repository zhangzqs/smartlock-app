import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smartlock_app/register.dart';
import 'package:smartlock_app/unlock_method/add_card.dart';
import 'package:smartlock_app/unlock_method/add_token.dart';
import 'package:smartlock_app/user_info_modify.dart';
import 'package:smartlock_app/widgets/time_picker.dart';
import 'login.dart';
import 'nfc_test.dart';
import 'drawer_test.dart';
import 'route_test.dart';
import 'route/rfid_reader.dart';
import 'qr_scanner_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("zh", "CH"),
        const Locale("en", "US"),
      ],
      home: HomePage(),
    );
  }
}

class RouteStartButton extends ElevatedButton {
  final String text;
  final Widget route;
  final BuildContext context;
  RouteStartButton(this.context, this.text, this.route)
      : super(
            onPressed: () async {
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return route;
                  },
                ),
              );

              print('返回结果：${result}');
            },
            child: Text(text));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Column(
        children: [
          RouteStartButton(context, 'Login', LoginRoute()),
          RouteStartButton(context, 'Register', RegisterRoute()),
          RouteStartButton(context, 'NFC', NfcTest()),
          RouteStartButton(context, 'Drawer', DrawerTestRoute()),
          RouteStartButton(context, 'RouteTest', RouteTest()),
          RouteStartButton(context, 'NFC_Reader', RfidReaderRoute()),
          RouteStartButton(context, 'QR', QRViewExample()),
          RouteStartButton(context, 'AddCard', AddCardRoute(uid: '123')),
          RouteStartButton(context, 'AddToken', AddTokenRoute()),
          RouteStartButton(context, 'UserMOdifier', UserModifierRouter()),
          RouteStartButton(context, 'DatePicker', DateTimePickerRouter()),
        ],
      ),
    );
  }
}
