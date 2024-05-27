import 'package:flutter/material.dart';
import 'package:todo_app/add_task.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/completed_task.dart';
import 'package:todo_app/provider/task_proivder.dart';


import 'package:todo_app/task_list.dart';
import 'package:todo_app/user_profile.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  get index => null;

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
              child: Text("All"),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          CompletedTask()), 
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
            InkWell(
               onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          UserProfile()), 
                );
              },
              child: Tab(
                icon: Icon(
                  Icons.person_rounded,
                  size: 22,
                ),
                child: Text("User"),
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
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Sabitler.floatingActionButtonColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddTask()));
        },
        child: Icon(Icons.add_rounded, color: Sabitler.floatingActionButtonIconColor),
      ),
    );
  }
}
