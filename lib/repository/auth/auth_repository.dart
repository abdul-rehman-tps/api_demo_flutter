import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:logger/logger.dart';

class AuthRepository {
  final Dio _dio = getx.Get.find();
  final Logger _logger = getx.Get.find();

  Future<bool> logIn({required String email, required String password}) async {
    try {
      Response<Map<String, dynamic>> response = await _dio
          .post<Map<String, dynamic>>('/login',
              data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        Map<String, dynamic>? result = response.data;

        return result?.containsKey('token') ?? false;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        _logger.e(e.response!.data);
        _logger.e(e.response!.headers);
        _logger.e(e.response!.requestOptions);
      } else {
        _logger.e(e.requestOptions);
        _logger.e(e.message);
      }
    }
    return false;
  }
}
