import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/auth_provider.dart';
import 'package:todo_app/app_constanst.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
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
        title: const Text("REGISTER",
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
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) =>
                    value!.isEmpty ? "Please enter your name" : null,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                validator: (value) =>
                    value!.isEmpty ? "Please enter your email" : null,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                validator: (value) =>
                    value!.isEmpty ? "Please enter password" : null,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(hintText: "Password"),
                obscureText: true,
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
                  onPressed: _register,
                  child: const Text("Register",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.createUserEmailAndPassword(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
      );
      // Additional logic after registration, like navigating to a different screen
    }
  }
}
