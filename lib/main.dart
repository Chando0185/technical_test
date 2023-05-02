import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/view/screens/page01.dart';
import 'package:technical_test/view/screens/page02.dart';
import 'package:technical_test/view/screens/page02test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Page01(),
    );
  }
}
