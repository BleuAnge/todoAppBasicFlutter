import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_basic/utility/todo_model.dart';
import 'package:todo_app_basic/utility/todo_provider.dart';

class TodoPage extends StatefulWidget {
  final TodoModel? todoData;

  const TodoPage({
    this.todoData,
    super.key
  });

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController textEditingController;
  late TextEditingController descriptionEditingController;
  late TodoListProvider provider;

  @override
  void initState() {
    provider = context.read<TodoListProvider>();
    textEditingController = TextEditingController(text: widget.todoData?.title);
    descriptionEditingController = TextEditingController(text: widget.todoData?.description);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8
          ),
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Write Your Title Here...",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Divider(
                thickness: 1,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextFormField(
                controller: descriptionEditingController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Write Your Description Here...',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.blue
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          Colors.white
                        )
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          switch (widget.todoData != null) {
                            case true:
                              provider.updateTodo(
                                widget.todoData!.copyWith(
                                  title: textEditingController.text,
                                  description: descriptionEditingController.text,
                                  updated: DateTime.now()
                                )
                              );
                              break;
                            case false:
                              provider.addTodo(
                                TodoModel(
                                  id: UniqueKey().hashCode,
                                  title: textEditingController.text,
                                  description: descriptionEditingController.text,
                                  created: DateTime.now(),
                                  updated: DateTime.now()
                                )
                              );
                              break;
                          }
                          Navigator.pop(context);
                        }
                      }, 
                      child: Text(
                        "Save"
                      )
                    )
                  ),
                ],
              ),
            ]
          ),
        )
      ),
    );
  }
}