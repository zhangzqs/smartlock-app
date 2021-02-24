import 'package:flutter/material.dart';
import 'package:smartlock_app/route/nfc_reader.dart';

class CardReaderField extends StatefulWidget {
  final Function(String) onUidReceived;
  final String uid;
  CardReaderField(this.onUidReceived, {this.uid});
  @override
  _CardReaderFieldState createState() =>
      _CardReaderFieldState(onUidReceived, uid);
}

class _CardReaderFieldState extends State<CardReaderField> {
  var controller = TextEditingController();
  final Function(String) onUidReceived;
  String uid;

  _CardReaderFieldState(this.onUidReceived, this.uid);

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
              prefixIcon: Icon(Icons.credit_card),
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
                  return NfcReaderRoute();
                },
              ));
              controller.text = uid;
              onUidReceived(uid);
              print('onUidReceived$uid');
            },
          ),
        )
      ],
    );
  }
}
