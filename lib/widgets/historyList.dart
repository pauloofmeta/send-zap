import 'package:flutter/material.dart';
import 'package:send_zap/models/history.dart';
import 'package:send_zap/repositories/historyRepository.dart';
import 'package:send_zap/widgets/historyItemCard.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<History>>(
        future: HistoryRepository.rp.getAll(),
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
              itemCount: snap.data.length,
              itemBuilder: (context, index) {
                History item = snap.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) => HistoryRepository.rp.delete(item),
                  child: HistoryItemCard(item),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}