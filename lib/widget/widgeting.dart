import 'package:flutter/material.dart';

class ListTileMethod extends StatelessWidget {
  final bool checkBoxValue;
  final String teks;

  const ListTileMethod(
      {super.key, required this.checkBoxValue, required this.teks});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
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
        title: Text(teks),
      ),
    );
  }

  Widget checkBoxWidget() {
    return Checkbox(
      activeColor: Colors.black,
      value: checkBoxValue,
      onChanged: (value) {},
    );
  }
}
