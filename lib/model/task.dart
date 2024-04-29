class Task{
  final String taskTitle;
  final String taskDetail;

  Task({required this.taskTitle, required this.taskDetail});

  @override
  String toString() {
    // TODO: implement toString
    return "$taskTitle ,$taskDetail";
  }
  
}