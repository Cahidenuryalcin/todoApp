import 'package:flutter/foundation.dart';
import 'package:todo_app/model/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

    void updateTask(int index, Task newTask) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index] = newTask;
      notifyListeners();
    }
  }

  

 
}
