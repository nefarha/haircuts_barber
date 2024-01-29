import 'package:dio/dio.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/services/fcm/i_fcm_provider.dart';

class FCMProvider implements IFcmProvider {
  String fcmKey =
      'AAAAvcCBips:APA91bFq-6L5a7j0P2tmwhCq-hMPUuve87KGS4t7KYAl0oG1CaMiKMnr3YZl9TP_1Pej5QBef_S0qjpAUy-FtUfWKCYl3v7OJBMs4PXAhVB43JMJKQeWE8m5QVBklg27hh91GSSD7uVp';

  // FCMProvider({required this.fcmKey});

  final dio = Dio();

  var baseUrl = 'https://fcm.googleapis.com/fcm/send';

  @override
  Future sendChat(
      {required String title,
      required String body,
      required String fcmToken}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$fcmKey'
    };

    var data = {
      "to": fcmToken,
      "priority": "high",
      "notification": {
        "title": title,
        "body": body,
        "sound": "default",
        "channel_id": "order"
      }
    };

    try {
      var a = await dio.post(baseUrl,
          data: data, options: Options(headers: headers));
    } catch (e) {
      buildErrorDialog(message: "$e");
    }
  }
}
