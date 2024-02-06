import 'package:api_demo/repository/auth_repository.dart';
import 'package:api_demo/repository/todo_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

void setupDependencies() {
  Get.put(Dio());
  Get.put(Logger());
  Get.put(AuthRepository());
  Get.put(TodoRepository());
}
