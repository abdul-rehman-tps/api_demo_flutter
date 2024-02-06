import 'package:api_demo/repository/auth/auth_repository.dart';
import 'package:api_demo/ui/screen/main/todo_list/todo_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isRememberMeChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      emailController.text = 'abdul.ghazi@tpsonline.com';
      passwordController.text = 'Aa12345678!';
    }
  }

  bool isValid() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<void> onLoginTap() async {
    if (!isValid()) {
      Get.snackbar('Error', 'Email and password is required');
      return;
    }

    bool loggedIn = await _authRepository.logIn(
      email: emailController.text,
      password: passwordController.text,
    );

    if (loggedIn) Get.off(const TodoListView());
  }
}
