import 'package:flutter/material.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/helper/data_helper.dart';
import 'package:todo_app/model/task.dart';

class AddTask extends StatefulWidget {
  final Function onTaskAdded;
  const AddTask({super.key, required this.onTaskAdded});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String taskTitle = "";
  String taskDetail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Sabitler.appbarColor,
        title: const Text("Add Task", style: TextStyle(fontFamily: "Montserrat", fontSize: 24, fontWeight: FontWeight.bold, color: Sabitler.appbarTextColor)),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 29, right: 29, top: 30),
        child: Form(
          key: formKey,  // Form key is now correctly associated
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) => taskTitle = value ?? "",
                validator: (value) => value!.isEmpty ? "Please enter a task name" : null,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: "Title"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                onSaved: (value) => taskDetail = value ?? "",
                validator: (value) => value!.isEmpty ? "Please enter task details" : null,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: "Detail"),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: const Color.fromRGBO(147, 149, 211, 1)),
                  onPressed: _taskAddAndList,
                  child: const Text("ADD", style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _taskAddAndList() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var newTask = Task(taskTitle: taskTitle, taskDetail: taskDetail);
      DataHelper.taskAdd(newTask);
      widget.onTaskAdded(); // Callback'i çağırarak durum güncellemesini tetikle
      Navigator.pop(context);  // Optionally pop the current route
    }
    print("$taskTitle, $taskDetail");
  }
}
