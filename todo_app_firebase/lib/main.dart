import 'package:flutter/material.dart';
import 'package:todo_app_ex/screens/task_list_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData.dark(),
      home: TaskListView(),
    );
  }
}
