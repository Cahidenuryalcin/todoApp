import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/helper/data_helper.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/provider/task_proivder.dart';
import 'package:todo_app/todo_list.dart';

class AddTask extends StatefulWidget {
 
  const AddTask({super.key});

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
          key: formKey,  
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
      var newTask = Task(taskTitle: taskTitle, taskDetail: taskDetail, id: '');
      /* DataHelper.taskAdd(newTask);
      widget.onTaskAdded(); 
      */// Callback'i çağırarak durum güncellemesini tetikle
      Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
      Navigator.pop(context);  
    }
    print("$taskTitle, $taskDetail");
  }
}
