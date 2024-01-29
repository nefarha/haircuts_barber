abstract class IFcmProvider {
  Future sendChat(
      {required String title, required String body, required String fcmToken});
}
