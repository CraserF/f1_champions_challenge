import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import 'color_schemes.g.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // The Material App to use.
    return MaterialApp(
      // The app title
      title: 'F1 Champions',
      // Light and dark themes
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      // The root page.
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}
