import 'package:flutter/material.dart';
import 'package:send_zap/widgets/chat.dart';
import 'package:send_zap/widgets/historyList.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Send ZAP'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "CHAT"),
              Tab(text: "HISTORICO"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Chat(),
            HistoryList()
          ],
        )
      ),
    );
  }
}