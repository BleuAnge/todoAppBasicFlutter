import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_basic/page/home/main.dart';
import 'package:todo_app_basic/utility/local_storage.dart';
import 'package:todo_app_basic/utility/todo_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoListProvider>(
      create: (context) => TodoListProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomePage(),
      ),
    );
  }
}

