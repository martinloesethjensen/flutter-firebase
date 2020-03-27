import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_ex/screens/add_task_dialog.dart';

import '../model/task.dart';

class TaskListView extends StatefulWidget {
  @override
  _TaskListViewState createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: (Task.tasks.length > 0) ? ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text("Completed Tasks"),
            initiallyExpanded: true,
            children: <Widget>[
              for (final task in Task.currentTasks) _listTile(task),
            ],
          ),
          Divider(),
          ExpansionTile(
            title: Text("Completed Tasks"),
            children: <Widget>[
              for (final task in Task.completedTasks) _listTile(task),
            ],
          )
        ],
      ) : Center(child: Text("No tasks has been made"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTask,
      ),
    );
  }

  ListTile _listTile(Task task) {
    return ListTile(
      leading: IconButton(
        icon: (task.completed)
            ? Icon(Icons.check_circle)
            : Icon(Icons.radio_button_unchecked),
        onPressed: () => toggleTask(task),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTask(task),
      ),
      title: Text(task.name),
      subtitle: (task.details != null) ? Text(task.details) : null,
    );
  }

  void toggleTask(Task task) {
    //TODO: update task for Firebase
    setState(() {
      task.completed = !task.completed;
    });
  }

  void _addTask() async {
    final Task newTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDialog(),
        fullscreenDialog: true,
      ),
    );

    if (newTask ?? false) {
      //TODO: add task to Firebase
      setState(() {
        Task.tasks.add(newTask);
      });
    }
  }

  void _deleteTask(Task task) async {
    final confirmed =
        (Platform.isIOS) // checking to see which widget we will be showing
            ? await showCupertinoDialog<bool>(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Delete Task?'),
                  content: Text('This task will be permanently deleted.'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('Cancel'),
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    CupertinoDialogAction(
                      child: Text('Delete'),
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
              )
            : await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Delete Task?'),
                  content: Text('This task will be permanently deleted.'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    FlatButton(
                      child: Text("Delete"),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
              );

    if (confirmed ?? false) {
      // ?? is a check to see if null then do something else
      //TODO: remove task from Firebase
      setState(() {
        Task.tasks.remove(task);
      });
    }
  }
}
