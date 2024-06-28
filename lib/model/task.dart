import 'package:flutter/material.dart';

class Task {
  String id;
  String taskTitle;
  String taskDetail;

  Task({required this.id, required this.taskTitle, required this.taskDetail});

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
    id: data['id'] ?? '', // Null değerler için varsayılan değer ataması
    taskTitle: data['taskTitle'] ?? '',
    taskDetail: data['taskDetail'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskTitle': taskTitle,
      'taskDetail': taskDetail,
    };
  }
}
