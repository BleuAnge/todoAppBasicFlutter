import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_basic/page/home/todo_card.dart';
import 'package:todo_app_basic/page/todo/main.dart';
import 'package:todo_app_basic/utility/todo_model.dart';
import 'package:todo_app_basic/utility/todo_provider.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todoData;

  const TodoTile({
    required this.todoData,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context, 
            builder: (context) {
              return TodoCard(todoData: todoData);
            }
          );
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * .8,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todoData.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      todoData.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => TodoPage(todoData: todoData)
                        )
                      );
                    }, 
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blueAccent,
                    )
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<TodoListProvider>(context, listen: false).removeTodo(todoData.id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  )
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}