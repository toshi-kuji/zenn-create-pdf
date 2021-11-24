import 'package:flutter/material.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Shippori',
        scrollbarTheme: ScrollbarThemeData(
          isAlwaysShown: true,
          thickness: MaterialStateProperty.all(12),
        ),
      ),
      home: const HomePage(),
    );
  }
}
