import 'package:flutter/material.dart';
import 'package:smartlock_app/route/rfid_reader.dart';

class CardReader extends StatefulWidget {
  final Null Function(String) onUidReceived;
  String uid;
  CardReader(this.onUidReceived, {this.uid});
  @override
  _CardReaderState createState() => _CardReaderState();
}

class _CardReaderState extends State<CardReader> {
  var controller = TextEditingController();
  final Null Function(String) onUidReceived;
  String uid;

  _CardReaderState(this.onUidReceived, this.uid);

  @override
  void initState() {
    super.initState();
    setState(() {
      controller.text = uid ?? "请点击右侧按钮录入门卡";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            enabled: false,
            controller: controller,
            decoration: InputDecoration(
              labelText: "请录入门卡ID",
              prefix: Icon(Icons.credit_card),
            ),
          ),
          flex: 10,
        ),
        Expanded(
          flex: 2,
          child: IconButton(
            icon: Icon(Icons.select_all),
            onPressed: () async {
              var uid = await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return RfidReaderRoute();
                },
              ));
              controller.text = uid;
              onUidReceived(uid);
            },
          ),
        )
      ],
    );
  }
}
