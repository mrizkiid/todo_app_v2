// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_v2/widget/widgeting.dart';

class Tampilan extends StatelessWidget {
  const Tampilan({super.key});
  void onDelete(BuildContext) {
    print('delete');
  }

  void onRead() {
    print('read');
  }

  void onWrite() {
    print('write');
  }

  @override
  Widget build(BuildContext context) {
    List _cehckboxBool = [
      false,
      true,
      false,
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: onWrite,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          elevation: 10,
          hoverElevation: 50,
        ),
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Text('TO Do APP'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              // padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20, top: 10),
              // margin: const EdgeInsets.only(bottom: 20),
              // decoration: BoxDecoration(
              //     color: Colors.yellow.shade600,
              //     border: Border.all(color: Colors.black),
              //     boxShadow: [
              //       BoxShadow(offset: Offset(8, 8)),
              //     ]),
              child: Slidable(
                endActionPane: ActionPane(motion: ScrollMotion(), children: [
                  SlidableAction(
                    onPressed: onDelete,
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    label: 'Delete',
                    icon: Icons.delete,
                    // padding: EdgeInsets.symmetric(horizontal: 70),
                    borderRadius: BorderRadius.circular(20),
                  )
                ]),
                child: ListTileMethod(
                    checkBoxValue: _cehckboxBool[index], teks: 'Bintang'),
              ),
            ),
          ),
        ));
  }
}
