import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance; // _auth => firebaseauth özelliğini kullanmak için değişken
  User? _user; // user değişkeni
  final FlutterSecureStorage storage = const FlutterSecureStorage(); // oturumun açık kalması içün

  User? get user => _user; //_user'a eriş, ama deiştireme

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged); // sınıfın constructor'ı, kullanıcı işlemleri yaptığında durum değişimi için tetiklenir
  }

  Future<void> _onAuthStateChanged(User? user) async { // kullanıcı oturum durumu değiştiğinde, user varsa user null olmaktan çıkar ve tüm arayüzlere bildirilir
    _user = user;
     if (user != null) {
      await storage.write(key: 'uid', value: user.uid);
    } else {
      await storage.delete(key: 'uid');
    }
    notifyListeners();
  }

  Future<UserCredential> loginUserEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    _user = userCredential.user;
    return userCredential;
  }

  
  Future<UserCredential> createUserEmailAndPassword(
      String email, String password, String name) async {
    UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
    await userCredential.user?.updateDisplayName(name);
    _user = userCredential.user;

    if (!_user!.emailVerified) {
      _user?.sendEmailVerification();
    }
    return userCredential;
  }


  Future<void> signOutUser() async {
    await _auth.signOut();
     _user = null;
    await storage.delete(key: 'uid');
    notifyListeners();
    debugPrint("cikis yapildi");
  }

   Future<void> deleteUser() async{
    if (_auth.currentUser!= null) {
       await _auth.currentUser!.delete();
       debugPrint("kullanıcı silindi");
    }else{
      debugPrint("önce kayit ol ");
    }
   
  }
}
