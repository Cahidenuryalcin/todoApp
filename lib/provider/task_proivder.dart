import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/model/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  List<Task> get tasks => _tasks;

  TaskProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged); // Kullanıcı durumu dinleyici eklendi
  }

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    await _loadTasks();
    notifyListeners();
  }

  Future<void> _loadTasks() async {
    if (_user != null) {
      try {
        QuerySnapshot snapshot = await _firestore
            .collection('tasks')
            .where('uid', isEqualTo: _user!.uid)
            .get();

        _tasks = snapshot.docs
            .map((doc) => Task.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
        notifyListeners();
      } catch (e) {
        print('Firestore veri yükleme hatası: $e');
      }
    } else {
      _tasks = []; // Kullanıcı çıkış yaptığında görev listesini temizle
      notifyListeners();
    }
  }

  Future<void> addTask(Task task) async {
    if (_user != null) {
      try {
        DocumentReference docRef = await _firestore.collection('tasks').add({
          'uid': _user!.uid,
          'taskTitle': task.taskTitle,
          'taskDetail': task.taskDetail,
        });
        task.id = docRef.id; // Belge ID'sini task içinde saklayın
        if (task.id.isNotEmpty) {
          _tasks.add(task);
          notifyListeners();
        } else {
          print('Görev eklenirken ID boş');
        }
      } catch (e) {
        print('Firestore görev ekleme hatası: $e');
      }
    }
  }

  Future<void> removeTask(String taskId) async {
    if (_user != null && taskId.isNotEmpty) {
      try {
        await _firestore.collection('tasks').doc(taskId).delete();
        _tasks.removeWhere((task) => task.id == taskId);
        notifyListeners();
      } catch (e) {
        print('Firestore silme hatası: $e');
      }
    } else {
      print('Geçersiz taskId veya kullanıcı kimliği');
    }
  }

  Future<void> updateTask(Task task, Task updatedTask) async {
    if (_user != null && task.id.isNotEmpty) {
      try {
        await _firestore.collection('tasks').doc(task.id).update({
          'taskTitle': updatedTask.taskTitle,
          'taskDetail': updatedTask.taskDetail,
        });

        int index = _tasks.indexWhere((t) => t.id == task.id);
        if (index != -1) {
          _tasks[index] = updatedTask; // Tüm görevi güncelle
          notifyListeners();
        }
      } catch (e) {
        print('Firestore güncelleme hatası: $e');
      }
    } else {
      print('Geçersiz taskId veya kullanıcı kimliği');
    }
  }
}
