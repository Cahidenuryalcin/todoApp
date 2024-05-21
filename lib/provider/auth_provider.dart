import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance; // _auth => firebaseauth özelliğini kullanmak için değişken
  User? _user; // user değişkeni

  User? get user => _user; //_user'a eriş, ama deiştireme

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged); // sınıfın constructor'ı, kullanıcı işlemleri yaptığında durum değişimi için tetiklenir
  }

  Future<void> _onAuthStateChanged(User? user) async { // kullanıcı oturum durumu değiştiğinde, user varsa user null olmaktan çıkar ve tüm arayüzlere bildirilir
    _user = user;
    notifyListeners();
  }

  Future<void> loginUserEmailAndPassword( // email ve şifreile giriş yapma işlemi
      String _email, String _password) async {
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      debugPrint(_userCredential.toString());
      debugPrint("kullanıcı giriş yapti");
    } catch (e) {
      //debugPrint(e.toString());
      debugPrint("önce kayit ol");
    }
  }

  Future<void> createUserEmailAndPassword(
      String _email, String _password, String _name) async { // email ve şifre ile kayıt olma işlemi. uygulamadı kullanıcı adı ile karşılama olacağı için
                                                            // name bilgisini güncelleyerek ekleniyor.
    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: _email, password: _password);
      await _userCredential.user?.updateDisplayName(_name);
      _user = _userCredential.user;

      if (!_user!.emailVerified) {
        _user?.sendEmailVerification();
      } else {
        debugPrint("kullanici maili onaylandi, sayfaya yönlendirilebilir");
      }

      debugPrint(_userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("zaten böyle bir kullanıcı var");
    }
  }

  Future<void> signOutUser() async {
    await _auth.signOut();
    debugPrint("cikis yapildi");
  }
}
