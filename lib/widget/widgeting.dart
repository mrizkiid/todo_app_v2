// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_v2/database/databasetodo.dart';

class ListTileMethod extends StatelessWidget {
  final bool checkBoxValue;
  // final String teks;
  final Box value;
  final String taskName;
  final int index;

  const ListTileMethod(
      {super.key,
      required this.checkBoxValue,
      // required this.teks,
      required this.value,
      required this.taskName,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20, top: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.yellow.shade600,
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(offset: Offset(8, 8)),
          ]),
      child: ListTile(
        leading: checkBoxWidget(),
        title: Text(taskName),
      ),
    );
  }

  Widget checkBoxWidget() {
    return Checkbox(
        activeColor: Colors.black,
        value: checkBoxValue,
        onChanged: (x) {
          bool checkBoxValueNew = !checkBoxValue;
          value.putAt(index, ModelTodo(taskName, checkBoxValueNew));
        });
  }
}
