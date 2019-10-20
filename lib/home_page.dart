import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_list/add_new_dialog.dart';
import 'package:todo_list/items_list.dart';
import 'package:todo_list/models/item.dart';
import 'package:todo_list/reducers/todoList/reducer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<Item>, _HomePageViewModel>(converter: (store) {
      return _HomePageViewModel(
          onSave: (String todoName) =>
              store.dispatch(AddTodoAction(Item(todoName))),
          onToggle: (int id) => store.dispatch(ToggleTodoAction(id)),
          todoItems: store.state);
    }, builder: (context, viewModel) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Todo list'),
        ),
        body: Container(
            child: ItemsList(
          items: viewModel.todoItems,
          onClick: (id, value) {
            viewModel.onToggle(id);
          },
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            return showDialog(
              context: context,
              builder: (context) {
                return AddNewDialog(
                  onSave: (value) {
                    viewModel.onSave(value);
                  },
                );
              },
            );
          },
          tooltip: 'Add new item',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}

class _HomePageViewModel {
  final Function(String name) onSave;
  final Function(int id) onToggle;
  final List<Item> todoItems;

  _HomePageViewModel({this.onSave, this.onToggle, this.todoItems});
}
