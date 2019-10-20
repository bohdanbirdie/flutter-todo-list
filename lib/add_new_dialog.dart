import 'package:flutter/material.dart';

class AddNewDialog extends StatefulWidget {
  final ValueChanged<String> onSave;

  AddNewDialog({ @required this.onSave });

  @override
  _AddNewDialogState createState() => _AddNewDialogState();
}

class _AddNewDialogState extends State<AddNewDialog> {
  final textInputController = TextEditingController();

  @override
  void dispose() {
    textInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add item'),
      content: TextField(
        controller: textInputController,
        decoration: InputDecoration(hintText: "Item name"),
      ),
      actions: <Widget>[
        FlatButton(
          child: new Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: new Text('SAVE'),
          onPressed: () {
            widget.onSave(textInputController.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
