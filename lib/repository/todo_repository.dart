import 'package:api_demo/model/base/repository_response.dart';
import 'package:api_demo/model/todo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:logger/logger.dart';

class TodoRepository {
  final Dio _dio = getx.Get.find();
  final Logger _logger = getx.Get.find();

  Future<RepositoryResponse<List<Todo>>> getTodos() async {
    try {
      Response<List<dynamic>> response =
          await _dio.get<List<dynamic>>('/todos');
      if (response.statusCode == 200) {
        List<Todo> todos =
            response.data?.map((e) => Todo.fromJson(e)).toList() ?? [];
        return RepositoryResponse<List<Todo>>(data: todos);
      } else {
        return RepositoryResponse<List<Todo>>.failed();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        _logger.e(
          'header: ${e.response!.headers}\ndata: ${e.response!.data}\n',
        );
      } else {
        _logger.e('message: ${e.requestOptions}');
      }
      return RepositoryResponse<List<Todo>>.failed(
        message: e.message ?? 'Something went wrong.',
      );
    }
  }
}
