import 'package:api_demo/model/base/repository_response.dart';
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
    RepositoryResponse<List<Todo>> response = await _todoRepository.getTodos();
    if (response.isSuccess) {
      todos.value = response.data!;
    } else {
      error.value = response.message;
    }
    isLoading.value = false;
  }

  Future<bool> onDismissedLeft(int index) async {
    RepositoryResponse<List<Todo>> response = await _todoRepository.getTodos();
    if (response.isSuccess) {
      todos.removeAt(index);
      Get.snackbar('Deleted', response.message);
    } else {
      error.value = response.message;
    }
    return response.isSuccess;
  }
}
