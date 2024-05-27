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
    return Scaffold(
  
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors
                .yellow, 
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
        body: Card(
        color: Sabitler.backgroundColor,
        
          child: Card(
            
            child:ElevatedButton(
              onPressed: () {
                _logOut();
              },
              child: Text('Log Out'),
            ),
          ),
        ),
    );
    
  }
  
  void _logOut() {
    final authProvider = Provider.of<my_auth.AuthProvider>(context, listen: false);
    authProvider.signOutUser(); // Oturumu sonlandır
     Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InitialScreen()),
      );
  }
}