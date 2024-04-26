import 'package:flutter/material.dart';
import 'package:todo_app/add_task.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/completed_task.dart';
import 'package:todo_app/edit_task.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<String> todoItems = [
    "TODO ITEM 1",
    "TODO ITEM 2",
    "TODO ITEM 3",
    "TODO ITEM 4"
  ]; // Örnek veri listesi

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Sabitler.backgroundColor,
      bottomNavigationBar: Material(
        color: Sabitler.tabbarColor,
        child: TabBar(
          labelColor: Sabitler.tabbarTextColor,
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.format_list_bulleted_rounded,
                size: 22,
              ),
              child: Text("Completed"),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          CompletedTask()), // This page will open when the button is pressed
                );
              },
              child: Tab(
                icon: Icon(
                  Icons.check_rounded,
                  size: 22,
                ),
                child: Text("Completed"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Sabitler.appbarColor,
        title: const Text(
          "TODO APP",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Sabitler.appbarTextColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_month_outlined,
                color: Sabitler.calendarIconColor,
              ))
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4.0),
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Sabitler.cardColor,
            child: ListTile(
              title: Text(
                todoItems[index],
                style: TextStyle(
                    color: Sabitler.listTileTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              subtitle: Text(
                "TODO SUB TITLE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
              trailing: Container(
                width: 96, // Adjust the width as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditTask()), // This page will open when the button is pressed
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Sabitler.floatingActionButtonColor,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    AddTask()), // This page will open when the button is pressed
          );
        },
        child: Icon(
          Icons.add_rounded,
          color: Sabitler.floatingActionButtonIconColor,
        ),
      ),
    );
  }
}
