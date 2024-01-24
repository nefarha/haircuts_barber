import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/payment/post_payment_model.dart';
import 'package:haircuts_barber_aja/app/data/services/flip_gateway/i_flip_gateway.dart';

class FlipGateway implements IFlipGateway {
  final dio = Dio();
  var baseUrl = "https://bigflip.id/big_sandbox_api";
  // var baseUrl = "https://bigflip.id/api";
  var secretKey =
      "JDJ5JDEzJHE3RXV5WEpzb2I0cjhDV2FiZERhZy51M0dsdEpwTXpkdWdGeGlRclpqTWt1UWQuaU12REcy";
  get secretBase64 => base64Encode(utf8.encode(secretKey));
  get header => {"Authorization": "Basic $secretBase64"};

  @override
  Future<Response?> createBill(
      {required PostPaymentModel postPaymentModel}) async {
    try {
      var response = await dio.post(
        '$baseUrl/v2/pwf/bill',
        options: Options(
            headers: header,
            contentType: Headers.formUrlEncodedContentType,
            validateStatus: (status) => true,
            responseType: ResponseType.json),
        data: postPaymentModel.toJson(),
      );
      print(response.data);
      return response;
    } catch (e) {
      buildErrorDialog(message: '$e');
    }
    return null;
  }
}
