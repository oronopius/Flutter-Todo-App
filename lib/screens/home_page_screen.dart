import 'package:flutter/material.dart';

import '../service/task.dart';
import '../service/todo_app.dart';
import 'create_task_form_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TodoApp todoApp = TodoApp.create();

  List<Task> tasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoApp.getAllTasks().then((value){
      setState(() {
        tasks = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Text('Entry ${tasks[index].title}'),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTaskFormScreen()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
