

import 'package:my_todo_app/service/task.dart';
import 'package:my_todo_app/storage/file_storage.dart';

import '../storage/abstract_storage.dart';
import '../storage/firebase_storage.dart';

class TodoApp {
  AbstractStorage abstractStorage;

  TodoApp(this.abstractStorage);

  static create() {
    var storage = FileStorage();
    return TodoApp(storage);
  }

  createTask(Task task) {
    abstractStorage.createTask(task);
  }

  getAllTasks() async{
    return abstractStorage.getAllTasks();
  }

  getTask(int id) {
    return abstractStorage.getTask(id);
  }

  updateTask(int id, Task updatedTask) {
    abstractStorage.updateTask(id, updatedTask);
  }

  deleteTask(int id) {
    abstractStorage.deleteTask(id);
  }
}
