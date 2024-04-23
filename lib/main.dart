import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

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
      backgroundColor: Color.fromRGBO(214, 215, 239, 1),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              height: 68,
              icon: Icon(
                Icons.format_list_bulleted_rounded,
                color: Color.fromRGBO(147, 149, 211, 1),
                size: 22,
              ),
              child: Text("All"),
            ),
            Tab(
              icon: Icon(
                Icons.check_rounded,
                color: Color.fromRGBO(147, 149, 211, 1),
                size: 22,
              ),
              child: Text("Completed"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(147, 149, 211, 1),
        title: Text(
          "TODO APP",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_month_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4.0),
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromRGBO(255, 255, 255, 1),
            child: ListTile(
              title: Text(todoItems[index]),
              subtitle: Text("TODO SUB TITLE"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color.fromRGBO(147, 149, 211, 1),
        onPressed: () {},
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
