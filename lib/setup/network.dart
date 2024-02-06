import 'package:dio/dio.dart';
import 'package:get/get.dart';

void setupApiClient() {
  Dio dio = Get.find();
  dio.options.baseUrl = 'https://onboarding.free.beeceptor.com';
  dio.options.headers = {'Content-Type': 'application/json'};
  // customize API calls here
}
