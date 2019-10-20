import 'package:flutter/material.dart';
import 'package:todo_list/models/item.dart';
import 'package:todo_list/todo_list_item.dart';

class ItemsList extends StatelessWidget {
  final List<Item> items;
  final Function(int id, bool value) onClick;

  const ItemsList({ @required this.items, @required this.onClick });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoListItem(todoItem: items[index], onClick: onClick,);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
