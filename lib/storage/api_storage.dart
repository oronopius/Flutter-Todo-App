import 'package:my_todo_app/service/task.dart';

import 'abstract_storage.dart';

class ApiStorage extends AbstractStorage {
  @override
  createTask(Task task) {
    print('Creating task with API');
  }

  @override
  deleteTask(int id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
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
