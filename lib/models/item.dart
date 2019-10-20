import 'dart:math';

class Item {
  final int _id = new Random.secure().nextInt(100);
  final String name;
  bool isComplete = false;

  Item(this.name);

  int get id {
    return _id;
  }
}