import 'package:flutter/material.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/edit_task.dart';
import 'package:todo_app/helper/data_helper.dart';
import 'package:todo_app/model/task.dart';

class TaskList extends StatelessWidget {
  final Function onElemenCikarildi;
  const TaskList({super.key, required this.onElemenCikarildi});

  @override
  Widget build(BuildContext context) {
    List<Task> allTasks = DataHelper.allTasks;

    return allTasks.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.all(4.0),
            itemCount: allTasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (a) {
                  onElemenCikarildi(index);
                  print("$index ");
                },
                child: Card(
                  color: Sabitler.cardColor,
                  child: ListTile(
                    title: Text(

                      "${allTasks[index].taskTitle}", // 'todoItems[index]' yerine 'task.title' düzeltildi.
                      style: TextStyle(
                        color: Sabitler.listTileTitleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      "${allTasks[index].taskDetail}", // Burası gerektiğinde dinamik hale getirilebilir.
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
                                  builder: (context) =>
                                      EditTask(), // EditTask'e 'task' parametresi eklendi.
                                ),
                              );
                            },
                            child: Icon(
                              Icons.mode_edit_outlined,
                              size: 20,
                              color: Sabitler.listTileTrailingIconColor,
                            ),
                          ),
                          Icon(
                            Icons.delete_outline_rounded,
                            size: 20,
                            color: Sabitler.listTileTrailingIconColor,
                          ),
                          Icon(
                            Icons.check_circle_outline_rounded,
                            size: 20,
                            color: Sabitler.listTileTrailingIconColor,
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
