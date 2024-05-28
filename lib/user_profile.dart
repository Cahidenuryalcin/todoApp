import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/provider/auth_provider.dart' as my_auth;

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<my_auth.AuthProvider>(context);
    final userName = authProvider.user?.displayName ?? 'Kullanıcı';

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.yellow,
        ),
        backgroundColor: Sabitler.appbarColor,
        title: const Text(
          "USER PROFILE",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Sabitler.appbarTextColor,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Merhaba $userName',
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Sabitler.appbarColor,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _logOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Sabitler.floatingActionButtonColor,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Sabitler.tabbarColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logOut() {
    final authProvider = Provider.of<my_auth.AuthProvider>(context, listen: false);
    authProvider.signOutUser();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  InitialScreen()),
    );
  }
}
