import 'package:flutter/material.dart';
import 'package:send_zap/models/history.dart';
import 'package:send_zap/services.dart';

class HistoryItemCard extends StatelessWidget {
  final History history;

  HistoryItemCard(this.history);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        
        child: ListTile(
          leading: Icon(Icons.history),
          title: Text(
            history.phone,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600
            ),
          ),
          subtitle: Text(history.description != null ? history.description : history.message),
          trailing: IconButton(
            icon: Icon(Icons.low_priority, color: Colors.green),
            onPressed: () async =>
              await AppService.app.sendMenssage(history),
          ),
        ),
      ),
    );
  }
}