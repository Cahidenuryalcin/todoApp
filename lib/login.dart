import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/provider/auth_provider.dart' as my_auth;
import 'package:todo_app/user_profile.dart';
import 'todo_list.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Sabitler.appbarColor,
        title: const Text("LOGIN",
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Sabitler.appbarTextColor)),
      ),
      body: Container(
           padding: const EdgeInsets.only(left: 29, right: 29, top: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
               const SizedBox(height: 40),
              SizedBox(  
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: const Color.fromRGBO(147, 149, 211, 1)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _login(context);
                    }
                  },
                    child: const Text("Login",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    final authProvider = Provider.of<my_auth.AuthProvider>(context, listen: false);
    try {
      await authProvider.loginUserEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserProfile()),
      );
    } catch (e) {
      // Handle error
    }
  }
}
