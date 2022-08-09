import 'package:flutter/material.dart';

import 'color_picker.dart';
import 'inner_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _navigateToColor(BuildContext context, MaterialAccentColor color) {
    // return navigateUsingBasic(context, color);
    // return navigateUsingRoutes(context, color);
    return navigateUsingDynamicRoutes(context, color);
  }

  void navigateUsingBasic(BuildContext context, MaterialAccentColor color) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InnerPage(color: color),
      ),
    );
  }

  void navigateUsingRoutes(BuildContext context, MaterialAccentColor color) {
    Navigator.of(context).pushNamed(
      InnerPage.routeName,
      arguments: color,
    );
  }

  void navigateUsingDynamicRoutes(
    BuildContext context,
    MaterialAccentColor color,
  ) {
    Navigator.of(context).pushNamed(
      InnerPage.routeName,
      arguments: color,
    );
  }

  void navigateToColorPicker(BuildContext context) async {
    final result = await Navigator.of(context)
        .pushNamed(ColorPickerPage.routeName) as Color;
    showPickerColorDialog(context, result);
  }

  void showPickerColorDialog(BuildContext context, Color color) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(children: [
              const Text('You have picked '),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
            ]),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Okay'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Colors')),
      body: ListView.builder(
        itemCount: Colors.accents.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _navigateToColor(context, Colors.accents[index]),
            child: Container(
              margin: const EdgeInsets.only(bottom: 2),
              height: 100,
              color: Colors.accents[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.colorize_outlined),
        onPressed: () => navigateToColorPicker(context),
      ),
    );
  }
}
