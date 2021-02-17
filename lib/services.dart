import 'package:android_intent/android_intent.dart';
import 'package:send_zap/models/history.dart';
import 'package:send_zap/repositories/historyRepository.dart';

class AppService {
  AppService._();

  static final AppService app = AppService._();

  sendMenssage(History history) async {
    String dataMessage = 'https://wa.me/${history.phone}?text=${history.message}';

    AndroidIntent intent = AndroidIntent(
      action: 'action_view',
      package: 'com.whatsapp',
      data: dataMessage
    );
    await intent.launch();
    await HistoryRepository.rp.create(history);
  }
}