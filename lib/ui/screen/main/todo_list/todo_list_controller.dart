import 'package:api_demo/model/todo.dart';
import 'package:api_demo/repository/todo_repository.dart';
import 'package:get/get.dart';

class TodoListController extends GetxController {
  final TodoRepository _todoRepository = Get.find();

  RxBool isLoading = false.obs;
  RxnString error = RxnString();
  RxList<Todo> todos = RxList<Todo>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getTodo();
  }

  Future<void> getTodo() async {
    isLoading.value = true;
    todos.value = await _todoRepository.getTodos() ?? [];
    isLoading.value = false;
  }
}
