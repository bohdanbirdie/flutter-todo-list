import 'package:flutter/material.dart';
import 'package:todo_list/models/item.dart';

enum RadioState { active, inactive }

class TodoListItem extends StatelessWidget {
  final Item todoItem;
  final Function(int id, bool value) onClick;

  const TodoListItem({@required this.todoItem, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          onClick(todoItem.id, !todoItem.isComplete);
        },
        title: Text(todoItem.name),
        leading: Radio<RadioState>(
          groupValue: RadioState.active,
          value: todoItem.isComplete ? RadioState.active : RadioState.inactive,
        ),
      ),
    );
  }
}
