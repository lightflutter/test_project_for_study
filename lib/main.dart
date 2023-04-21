import 'package:flutter/material.dart';
import 'package:test_project_for_study/HintLabel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget Sample',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        backgroundColor: Colors.amber[300],
        appBar: AppBar(
          title: const Text('Labels'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              HintLabel('Custom Label 1'),
              SizedBox(height: 8.0),
              Text('Text widget'),
              SizedBox(height: 8.0),
              HintLabel('Custom Label 2'),
            ],
          ),
        ),
      ),
    );
  }
}
