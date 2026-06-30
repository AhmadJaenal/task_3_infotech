import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_3_infotech/app/modules/home/provider/todo_provider.dart';
import 'package:task_3_infotech/app/modules/home/view/home_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TaskProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
