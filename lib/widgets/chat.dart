import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_zap/models/history.dart';
import 'package:send_zap/services.dart';

class Chat extends StatelessWidget {
  final numberController = new TextEditingController();
  final menssageController = TextEditingController();

  _sendMenssage() async {
    var history = new History(
      phone: numberController.text,
      message: menssageController.text 
    );
    await AppService.app.sendMenssage(history);
    numberController.clear();
    menssageController.clear();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child:
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: 
                  TextField(
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      hintText: 'Número',
                      labelText: 'Número'
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                    controller: numberController,
                  ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: 
                  TextField(
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(),
                      hintText: 'Menssagem',
                      labelText: 'Menssagem'
                    ),
                    controller: menssageController,
                  ),
              ),
              FlatButton(
                child: Text(
                  'Whatsapp',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                color: Colors.green,
                onPressed: () async => _sendMenssage(),
              )
            ],
          ),
    );
  }
}