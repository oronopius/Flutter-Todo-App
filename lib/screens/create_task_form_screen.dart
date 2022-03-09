import 'package:flutter/material.dart';
import 'package:my_todo_app/service/task.dart';
import 'package:my_todo_app/service/todo_app.dart';

class CreateTaskFormScreen extends StatefulWidget {
  const CreateTaskFormScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskFormScreen> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  var tasksCreated = [];

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('*****');
    print(tasksCreated);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('Create task')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Title'),
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Text('Description'),
                TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the description';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        await _processCreateTask();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  _processCreateTask() async{
    String title = titleController.text;
    String description = descriptionController.text;

    Task task = Task(title, description);
    TodoApp todoApp = TodoApp.create();
    todoApp.createTask(task);
    var tasks = await todoApp.getAllTasks();
    print('***TASKS***');
    print(tasks);
  }
}
