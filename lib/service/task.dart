import 'dart:convert';

class Task {
  String title;
  String description;

  Task(this.title, this.description);

  @override
  String toString() {
    return 'Task{title: $title, description: $description}';
  }

  factory Task.fromJson(Map<String, dynamic> jsonData) {
    return Task(jsonData['title'], jsonData['description']);
  }

  static Map<String, dynamic> toMap(Task task) => {
        'title': task.title,
        'description': task.description,
      };

  static String encode(List<Task> tasks) => json.encode(
        tasks.map<Map<String, dynamic>>((music) => Task.toMap(music)).toList(),
      );

  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<Task>((item) => Task.fromJson(item))
          .toList();
}
