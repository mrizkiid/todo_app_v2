import 'package:flutter/material.dart';
import 'package:todo_app_v2/page/pageviewlat.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_v2/database/databasetodo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ModelAdapter());
  // var box = await Hive.openBox('boxtodo');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final box;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.yellow, unselectedWidgetColor: Colors.black),
      home: FutureBuilder(
          future: Hive.openBox('boxtodo'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('error'),
                );
              } else {
                return Tampilan();
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
