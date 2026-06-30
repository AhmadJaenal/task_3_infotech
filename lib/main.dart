import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_3_infotech/app/modules/home/provider/todo_provider.dart';
import 'package:task_3_infotech/app/modules/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (_) => TaskProvider(),
          child: MaterialApp(
            title: 'TODO List',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.indigo,
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.grey.shade50,
            ),
            home: const HomeView(),
          ),
        );
      },
    );
  }
}
