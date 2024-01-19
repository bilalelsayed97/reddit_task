import 'package:flutter/material.dart';
import 'package:reddit_task/features/home/presentation/home_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reddit',
        home: MyHomePage(),
      );
    });
  }
}
