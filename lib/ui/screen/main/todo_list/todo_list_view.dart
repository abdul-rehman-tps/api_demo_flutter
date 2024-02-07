import 'package:api_demo/ui/screen/main/todo_list/todo_list_controller.dart';
import 'package:api_demo/ui/widget/item_todo_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoListController c = Get.put(TodoListController());

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
                () => c.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : c.error.value != null
                        ? Center(child: Text(c.error.value!))
                        : ListView.separated(
                            itemCount: c.todos.length,
                            itemBuilder: (_, int index) =>
                                ItemTodoList(todo: c.todos[index]),
                            separatorBuilder: (_, int index) => const Divider(),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
