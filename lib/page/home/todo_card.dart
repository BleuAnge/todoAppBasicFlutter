import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_basic/page/todo/main.dart';
import 'package:todo_app_basic/utility/todo_model.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todoData;

  TodoCard({
    required this.todoData,
    super.key
  });

  final DateFormat _format = DateFormat("yyyy-MM-dd-HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * .8,
        height: MediaQuery.sizeOf(context).height * .3,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              todoData.title
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => TodoPage(todoData: todoData)
                    )
                  );
                }, 
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blueAccent,
                )
              )
            ],
          ),
          body: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4
            ),
            decoration: BoxDecoration(
              border: Border(
                top:  BorderSide(
                  color: Colors.black,
                  width: 1
                ),
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1
                )
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    todoData.description
                  ),
                ),
              ]
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Created At: ${_format.format(todoData.created)}",
                  style: TextStyle(
                    fontSize: 10
                  ),
                ),
                Text(
                  "Updated At: ${_format.format(todoData.updated)}",
                  style: TextStyle(
                    fontSize: 10
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}