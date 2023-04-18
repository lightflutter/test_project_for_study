import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:  Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('This is Flutter'),
        ),
        body: const Center(
          child: Text('Hello World',
            style: TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
        ),
      ),
    );
  }
}
