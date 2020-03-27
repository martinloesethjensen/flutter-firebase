import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskDialog extends StatefulWidget {
  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  String _taskName = "";
  String _taskDesc;

  void _save() {
    final task = _taskName.isNotEmpty ? Task(_taskName, _taskDesc) : null;
    Navigator.of(context).pop(task); // will send task back
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _save,
          )
        ],
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Task name",
                ),
                autofocus: true,
                onChanged: (value) => _taskName = value,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Task details",
                ),
                onChanged: (value) => _taskDesc = value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
