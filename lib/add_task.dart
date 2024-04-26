import 'package:flutter/material.dart';
import 'package:todo_app/app_constanst.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors
                .white, // Sadece bu AppBar için geri dönüş butonu yeşil olacak
          ),
          backgroundColor: Sabitler.appbarColor,
          title: const Text(
            "Add Task",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Sabitler.appbarTextColor,
            ),
          ),
        ),
        body: Container(
          width: 500,
          padding: const EdgeInsets.only(
              left: 29, right: 29, top: 30), // Alt çizginin konumu için padding

          child: Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Title",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Detail",
                  ),
                ),
                const SizedBox(
                    height: 50), // TextFormField ile buton arasındaki boşluk

                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12) // Köşe yarıçapını 30 olarak ayarla
                            ),
                        backgroundColor: const Color.fromRGBO(147, 149, 211, 1),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "ADD",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
