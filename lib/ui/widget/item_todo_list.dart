import 'package:api_demo/model/todo.dart';
import 'package:flutter/material.dart';

class ItemTodoList extends StatefulWidget {
  final Todo todo;

  const ItemTodoList({super.key, required this.todo});

  @override
  State<ItemTodoList> createState() => _ItemTodoListState();
}

class _ItemTodoListState extends State<ItemTodoList> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.todo.completed,
      title: Text(widget.todo.title ?? 'N/A'),
      onChanged: (value) {
        widget.todo.completed = value;
      },
    );
  }
}
