import 'package:my_todo_app/service/task.dart';

import 'abstract_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FileStorage extends AbstractStorage {

  @override
  createTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    String? allTasks = await _getSavedTasks();
    List<Task> tasksToSave = [];
    if(allTasks == '' || allTasks == null){
      tasksToSave.add(task);
    }else{
      tasksToSave = Task.decode(allTasks);
      tasksToSave.add(task);
    }
    String encodedTasks = Task.encode(tasksToSave);
    await prefs.setString('tasks', encodedTasks);
  }

  _getSavedTasks() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('tasks');
  }

  @override
  deleteTask(int id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  getAllTasks() async{
    String? savedTasks = await _getSavedTasks();
    if(savedTasks == '' || savedTasks == null){
      return [];
    }
    return Task.decode(savedTasks);
  }

  @override
  getTask(int id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  updateTask(int id, Task updatedTask) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
