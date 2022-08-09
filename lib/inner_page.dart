import 'package:flutter/material.dart';
import 'package:navigation/main.dart';

class InnerPage extends StatelessWidget {
  static String routeName = '/inner';

  const InnerPage({
    Key? key,
    required this.color,
  }) : super(key: key);

  final MaterialAccentColor color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: color),
      body: ListView.builder(
        itemCount: accents.length,
        itemBuilder: (BuildContext context, int index) {
          final accentValue = accents[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 2),
            height: 100,
            color: color[accentValue],
          );
        },
      ),
    );
  }
}
