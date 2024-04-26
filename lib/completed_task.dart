import 'package:flutter/material.dart';
import 'package:todo_app/app_constanst.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors
                .white, // Sadece bu AppBar için geri dönüş butonu yeşil olacak
          ),
          backgroundColor: Sabitler.appbarColor,
          title: const Text(
            "Completed Task",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Sabitler.appbarTextColor,
            ),
          ),
        ),
    );
  }
}