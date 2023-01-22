// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app_v2/widget/mybutton.dart';

class BoxDiaolog extends StatelessWidget {
  final VoidCallback onwrite;
  final VoidCallback oncancel;
  final TextEditingController controllerTask;
  const BoxDiaolog(
      {super.key,
      required this.onwrite,
      required this.oncancel,
      required this.controllerTask});

  // TextEditingController controllerTask  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              child: TextField(
                controller: controllerTask,
                decoration: InputDecoration(
                    hintText: 'Do what you want',
                    // contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    suffixIcon: IconButton(
                        onPressed: () => controllerTask.clear(),
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(teks: 'add', onpressed: onwrite),
                  SizedBox(
                    width: 8,
                  ),
                  MyButton(
                    teks: 'cancel',
                    onpressed: oncancel,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
