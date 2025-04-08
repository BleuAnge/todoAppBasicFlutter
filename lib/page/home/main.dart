import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_basic/page/home/todo_tile.dart';
import 'package:todo_app_basic/page/todo/main.dart';
import 'package:todo_app_basic/utility/todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<TodoListProvider>().init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Basic Todo App'),
      ),
      body: Consumer<TodoListProvider>(
        builder: (context, todoList, child) {
          final todos = todoList.todoList;
          if (todos.isEmpty) {
            return Center(
              child: Text('No Todo Found'),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(2),
            itemCount:todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoTile(todoData: todo);
            },
          );
        }
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) {
                return TodoPage();
              }
            )
          );
        }, 
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(50)
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}