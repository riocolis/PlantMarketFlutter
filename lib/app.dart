import 'package:flutter/material.dart';

import 'ui/pages/pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeneralPage(
        title: 'Title',
        subtitle: 'Subtitle',
        onBackButtonPressed: () {},
      ),
    );
  }
}
