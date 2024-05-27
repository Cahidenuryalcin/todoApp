import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:todo_app/app_constanst.dart';
import 'package:todo_app/login.dart';
import 'package:todo_app/provider/auth_provider.dart' as my_auth;
import 'package:todo_app/provider/task_proivder.dart';
import 'package:todo_app/register.dart';
import 'package:todo_app/user_profile.dart';
import 'todo_list.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => my_auth.AuthProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialScreen(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<my_auth.AuthProvider>(context);

    if (authProvider.user == null) {
      return WelcomeScreen();
    } else {
      return AnaSayfa();
    }
  }
}
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontFamily: "Montserrat",
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'tadatodo',
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Sabitler.appbarColor2,
              ),
            ),
          ],
        ),
        backgroundColor: Sabitler.appbarTextColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bk4.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 5),
            Text(
              "Tadaa :D Let's todo this!",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat",
              ),
            ),
            Container(
              margin: EdgeInsets.all(40),
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/hello1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text('Login'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}