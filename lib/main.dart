import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:todo_list/reducers/todoList/reducer.dart';

import 'home_page.dart';
import 'models/item.dart';

void main() {
  final store = new Store<List<Item>>(todosReducer,
      initialState: [], middleware: [new LoggingMiddleware.printer()]);

  runApp(new MainApp(store));
}

class MainApp extends StatelessWidget {
  final Store<List<Item>> store;

  MainApp(this.store);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<List<Item>>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.green,
              toggleableActiveColor: Colors.blue),
          home: HomePage(),
        ));
  }
}
