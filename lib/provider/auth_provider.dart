import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  User? get user => _user;

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    if (user != null) {
      await storage.write(key: 'uid', value: user.uid);
    } else {
      await storage.delete(key: 'uid');
    }
    notifyListeners();
  }

  Future<UserCredential> loginUserEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    _user = userCredential.user;
    return userCredential;
  }

  Future<UserCredential> createUserEmailAndPassword(String email, String password, String name) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await userCredential.user?.updateDisplayName(name);
    await userCredential.user?.reload();  
    _user = _auth.currentUser;  

    if (!_user!.emailVerified) {
      _user?.sendEmailVerification();
    }
    notifyListeners();  
    return userCredential;
  }

  Future<void> signOutUser() async {
    await _auth.signOut();
    _user = null;
    await storage.delete(key: 'uid');
    notifyListeners();
    debugPrint("Logout successful");
  }

  Future<void> deleteUser() async {
    if (_auth.currentUser != null) {
      await _auth.currentUser!.delete();
      debugPrint("User deleted");
    } else {
      debugPrint("First register");
    }
  }
}
