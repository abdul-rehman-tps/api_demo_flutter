import 'package:api_demo/model/todo.dart';
import 'package:flutter/material.dart';

class ItemTodoList extends StatefulWidget {
  final Todo todo;
  final Future<bool> Function()? onDismissedLeft;

  const ItemTodoList({super.key, required this.todo, this.onDismissedLeft});

  @override
  State<ItemTodoList> createState() => _ItemTodoListState();
}

class _ItemTodoListState extends State<ItemTodoList> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.todo.id.toString()),
      confirmDismiss: (_) async => await widget.onDismissedLeft?.call(),
      direction: DismissDirection.endToStart,
      child: CheckboxListTile(
        value: widget.todo.completed,
        title: Text(widget.todo.title ?? 'N/A'),
        onChanged: (value) => setState(() => widget.todo.completed = value),
      ),
    );
  }
}
