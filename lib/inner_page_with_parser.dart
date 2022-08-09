import 'package:flutter/material.dart';

import 'inner_page.dart';

class InnerPageWithColorParser extends StatelessWidget {
  static String routeName = '/inner-with-parser';

  const InnerPageWithColorParser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parsedMaterialColor =
        ModalRoute.of(context)!.settings.arguments as MaterialAccentColor;
    return InnerPage(color: parsedMaterialColor);
  }
}
