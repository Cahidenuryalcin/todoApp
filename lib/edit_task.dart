import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/model/task.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/task_proivder.dart';

class EditTask extends StatefulWidget {
  final Task task;
  final int index; 

  const EditTask({super.key, required this.task, required this.index});

  @override
  State<EditTask> createState() => _EditListState();
}

class _EditListState extends State<EditTask> {
  late TextEditingController _titleController;
  late TextEditingController _detailController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.taskTitle);
    _detailController = TextEditingController(text: widget.task.taskDetail);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Sabitler.appbarColor,
        title: const Text("Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _titleController, 
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextFormField(
                controller: _detailController,
                decoration: const InputDecoration(labelText: "Detail"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Güncelleme fonksiyonu
                      Task updatedTask = Task(
                        taskTitle: _titleController.text,
                        taskDetail: _detailController.text,
                      );
                      Provider.of<TaskProvider>(context, listen: false)
                          .updateTask(widget.index, updatedTask);
                      Navigator.pop(context); // Güncelleme sonrası sayfayı kapat
                    },
                    child: const Text("Update"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // İptal et ve sayfayı kapat
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
