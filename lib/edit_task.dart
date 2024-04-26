import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/app_constanst.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditListState();
}

class _EditListState extends State<EditTask> {
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
            "Edit Task",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Sabitler.appbarTextColor,
            ),
          ),
        ),
        body: Container(
          width: 400,
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
                    height: 20), // TextFormField ile buton arasındaki boşluk

                SizedBox(
                  width: 500,
                  height: 95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize:Size.fromHeight(60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12) // Köşe yarıçapını 30 olarak ayarla
                                  ),
                              backgroundColor:
                                  const Color.fromRGBO(147, 149, 211, 1),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Update",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ),
                      SizedBox(width: 40,),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize:Size.fromHeight(60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12) // Köşe yarıçapını 30 olarak ayarla
                                  ),
                              backgroundColor:
                                  const Color.fromRGBO(147, 149, 211, 1),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
