import 'package:api_demo/model/todo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:logger/logger.dart';

class TodoRepository {
  final Dio _dio = getx.Get.find();
  final Logger _logger = getx.Get.find();

  Future<List<Todo>?> getTodos() async {
    try {
      Response<List<Map<String, dynamic>>> response =
          await _dio.get<List<Map<String, dynamic>>>('/todos');
      if (response.statusCode == 200) {
        return response.data?.map((e) => Todo.fromJson(e)).toList();
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        _logger.e(
          'header: ${e.response!.headers}\ndata: ${e.response!.data}\n',
        );
      } else {
        _logger.e('message: ${e.requestOptions}');
      }
    }
    return null;
  }
}
