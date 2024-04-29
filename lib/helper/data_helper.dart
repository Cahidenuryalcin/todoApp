import 'package:todo_app/model/task.dart';

class DataHelper{
  static List<Task> allTasks=[];

  static taskAdd(Task task){
    allTasks.add(task);
  }
  
}