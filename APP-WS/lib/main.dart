import 'package:GlamourApp/inicial.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glamour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaInicial(title: 'GlamourApp'),
    );
  }
}
