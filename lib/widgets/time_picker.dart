import 'package:date_format/date_format.dart' as df;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DateTimePicker extends StatefulWidget {
  final Null Function(DateTime) onPickerSuccess;
  final String text;
  final String content;

  DateTimePicker(this.onPickerSuccess, {this.text, this.content});
  @override
  _DateTimePickerState createState() => _DateTimePickerState(
        onPickerSuccess,
        text,
        content,
      );
}

class _DateTimePickerState extends State<DateTimePicker> {
  TextEditingController controller = TextEditingController();
  Null Function(DateTime) onPickerSuccess;
  String text;
  String content;
  _DateTimePickerState(this.onPickerSuccess, this.text, this.content);

  @override
  void initState() {
    super.initState();
    setState(() {
      controller.text = content ??
          df.formatDate(DateTime.now(),
              [df.yyyy, '年', df.mm, '月', df.dd, '日', df.hh, ':', df.nn]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: TextFormField(
            enabled: false,
            controller: controller,
            decoration: InputDecoration(
              labelText: text ?? "请选择日期时间",
              prefixIcon: Icon(Icons.access_time),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: IconButton(
            icon: Icon(Icons.select_all),
            onPressed: () async {
              var dateTime = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  Duration(days: 365 * 10),
                ),
                locale: Locale('zh'),
              );
              if (dateTime == null) {
                return;
              }
              var timeOfDay = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (context, child) {
                  return Localizations(
                    locale: const Locale('zh'),
                    child: child,
                    delegates: [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                  );
                },
              );
              if (timeOfDay == null) {
                return;
              }
              dateTime = dateTime.add(
                Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute),
              );
              onPickerSuccess(dateTime);
              setState(
                () {
                  content = df.formatDate(dateTime, [
                    df.yyyy,
                    '年',
                    df.mm,
                    '月',
                    df.dd,
                    '日',
                    '    ',
                    df.hh,
                    ':',
                    df.nn
                  ]);
                  controller.text = content;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class DateTimePickerRouter extends StatefulWidget {
  @override
  _DateTimePickerRouterState createState() => _DateTimePickerRouterState();
}

class _DateTimePickerRouterState extends State<DateTimePickerRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picker'),
      ),
      body: Column(
        children: [
          DateTimePicker((DateTime time) {
            print(time);
          }),
        ],
      ),
    );
  }
}
