import 'package:todo_list/models/item.dart';
import 'package:todo_list/reducers/todoList/actions.dart';

class AddTodoAction {
  final Item todo;
  AddTodoAction(this.todo);
}

class ToggleTodoAction {
  final int todoId;
  ToggleTodoAction(this.todoId);
}

List<Item> todosReducer(List<Item> state, dynamic action) {
  if (action is AddTodoAction) {
    List<Item> newList = List.from(state);
    newList.add(action.todo);
    return newList;
  } else if (action is ToggleTodoAction) {
    List<Item> newList = List.from(state);
    Item item = newList.firstWhere((item) => item.id == action.todoId);
    item.isComplete = !item.isComplete;
    return newList;
  }

  return state;
}