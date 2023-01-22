import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String teks;
  final VoidCallback onpressed;
  const MyButton({Key? key, required this.teks, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Colors.yellow.shade600,
      child: Text(teks),
    );
  }
}
