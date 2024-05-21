import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Sabitler.appbarColor,
        title: const Text("LOGIN", style: TextStyle(fontFamily: "Montserrat", fontSize: 24, fontWeight: FontWeight.bold, color: Sabitler.appbarTextColor)),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 29, right: 29, top: 30),
        child: Form(
          //key: formKey,  
          child: Column(
            children: [
              TextFormField(
                onSaved: (newValue) {
                  
                },
                //onSaved: (value) => taskTitle = value ?? "",
                validator: (value) => value!.isEmpty ? "Please enter your email" : null,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                onSaved: (newValue) {
                  
                },
                validator: (value) => value!.isEmpty ? "Please enter password" : null,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(hintText: "Password"),
                obscureText: true,
              ),
              
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: const Color.fromRGBO(147, 149, 211, 1)),
                  onPressed: (){},
                  child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
