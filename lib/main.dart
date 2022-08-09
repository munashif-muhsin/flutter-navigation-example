import 'package:flutter/material.dart';
import 'package:navigation/color_picker.dart';
import 'package:navigation/home_page.dart';
import 'package:navigation/inner_page.dart';
import 'package:navigation/inner_page_with_parser.dart';

const accents = [100, 200, 400, 700];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        ColorPickerPage.routeName: (context) => const ColorPickerPage(),
        InnerPage.routeName: (context) => const InnerPageWithColorParser(),
      },
    );
  }
}
