import 'package:my_todo_app/service/task.dart';

abstract class AbstractStorage {
  createTask(Task task);

  getAllTasks();

  getTask(int id);

  updateTask(int id, Task updatedTask);

  deleteTask(int id);
}
