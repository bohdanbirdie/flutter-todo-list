import 'package:flutter/material.dart';
import 'package:todo_list/add_new_dialog.dart';
import 'package:todo_list/items_list.dart';
import 'package:todo_list/models/item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list'),
      ),
      body: Container(
          child: ItemsList(
        items: todoItems,
        onClick: (id, value) {
          setState(() {
            Item item = todoItems.firstWhere((item) => item.id == id);
            item.isComplete = value;
          });
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AddNewDialog(
                onSave: (value) {
                  print(value);
                  setState(() {
                    todoItems.add(Item(value));
                  });
                },
              );
            },
          );
        },
        tooltip: 'Add new item',
        child: Icon(Icons.add),
      ),
    );
  }
}
