import 'package:dio/dio.dart';
import 'package:haircuts_barber_aja/app/data/model/payment/post_payment_model.dart';

abstract class IFlipGateway {
  Future<Response?> createBill({required PostPaymentModel postPaymentModel});
}
