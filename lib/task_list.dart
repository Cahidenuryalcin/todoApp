import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/edit_task.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/provider/task_proivder.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> allTasks = Provider.of<TaskProvider>(context).tasks;

    return allTasks.isNotEmpty
        ? ListView.builder(
            padding: const EdgeInsets.all(4.0),
            itemCount: allTasks.length,
            itemBuilder: (context, index) {
              Task task = allTasks[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  Provider.of<TaskProvider>(context, listen: false).removeTask(task.id); // Düzeltildi
                },
                child: Card(
                  color: Sabitler.cardColor,
                  child: ListTile(
                    title: Text(
                      task.taskTitle,
                      style: TextStyle(
                        color: Sabitler.listTileTitleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      task.taskDetail,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    trailing: Container(
                      width: 96,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditTask(task: task),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.mode_edit_outlined,
                              size: 20,
                              color: Sabitler.listTileTrailingIconColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Provider.of<TaskProvider>(context, listen: false).removeTask(task.id); // Düzeltildi
                            },
                            child: Icon(
                              Icons.delete_outline_rounded,
                              size: 20,
                              color: Sabitler.listTileTrailingIconColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Ekstra fonksiyonellik eklemek isterseniz buraya ekleyin
                            },
                            child: Icon(
                              Icons.check_circle_outline_rounded,
                              size: 20,
                              color: Sabitler.listTileTrailingIconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
              "Lütfen Görev Ekleyin",
              style: TextStyle(
                color: Sabitler.listTileTitleColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          );
  }
}
