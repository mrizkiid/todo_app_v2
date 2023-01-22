// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_v2/widget/dialog_box_aler.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_v2/widget/widgeting.dart';
import 'package:todo_app_v2/database/databasetodo.dart';

class Tampilan extends StatefulWidget {
  const Tampilan({super.key});

  @override
  State<Tampilan> createState() => _TampilanState();
}

class _TampilanState extends State<Tampilan> {
  TextEditingController controllerTask = TextEditingController();
  // ModelTodo? data;
  void onDelete(BuildContext context, Box value, int index) async {
    await value.deleteAt(index);
    print('Value on Delete ${value.keys}');
    print(index);
  }

  void onUpdate(Box value, String teks, bool x, int index) {
    value.putAt(index, ModelTodo(teks, x));
    print('Value on Update ${value.keys}');
  }

  void onWrite(Box value, String teks) async {
    await value.add(ModelTodo(teks, false));
    print('Value on write ${value.keys}');
  }

  void onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  void dialogBox({required Box value}) {
    showDialog(
      context: context,
      builder: (context) {
        return BoxDiaolog(
          controllerTask: controllerTask,
          oncancel: () => onCancel(context),
          onwrite: () {
            onWrite(value, controllerTask.text);
            // Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var boxValue = Hive.box('boxtodo');
    return ValueListenableBuilder(
      valueListenable: boxValue.listenable(),
      builder: (context, value, _) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => dialogBox(value: value),
          backgroundColor: Colors.black,
          elevation: 10,
          hoverElevation: 50,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Text('TO Do APP'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                ModelTodo data = value.getAt(index);
                if (boxValue.length == 0) {
                  return Center(
                    child: Text('Data Kosong'),
                  );
                } else {
                  return Container(
                    // padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20, top: 10),
                    // margin: const EdgeInsets.only(bottom: 20),
                    // decoration: BoxDecoration(
                    //     color: Colors.yellow.shade600,
                    //     border: Border.all(color: Colors.black),
                    //     boxShadow: [
                    //       BoxShadow(offset: Offset(8, 8)),
                    //     ]),
                    child: Slidable(
                      endActionPane:
                          ActionPane(motion: ScrollMotion(), children: [
                        SlidableAction(
                          onPressed: (context) =>
                              onDelete(context, value, index),
                          backgroundColor: Colors.yellow,
                          foregroundColor: Colors.black,
                          label: 'Delete',
                          icon: Icons.delete,
                          // padding: EdgeInsets.symmetric(horizontal: 70),
                          borderRadius: BorderRadius.circular(20),
                        )
                      ]),
                      child: ListTileMethod(
                        value: value,
                        index: index,
                        taskName: data.titleActivity,
                        checkBoxValue: data.checkActivity,
                        // teks: data.titleActivity + '===' + index.toString(),
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
