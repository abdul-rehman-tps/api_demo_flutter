import 'package:api_demo/ui/screen/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController c = Get.put(LoginController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_landing.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                width: Get.mediaQuery.size.width,
                child: Image.asset(
                  'assets/images/map_dots.png',
                  fit: BoxFit.cover,
                ),
              ),
              Obx(
                () => const Center(child: CircularProgressIndicator()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
