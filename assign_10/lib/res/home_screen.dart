import 'package:api_test/res/edit_data.dart';
import 'package:flutter/material.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({super.key});

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Info> todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Todo ")),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Enter Title",
                            labelText: "Add Title"),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter a value';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Enter Description",
                            labelText: "Add Description"),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter a value';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                todoList.add(Info(
                                    name: _titleController.text.trim(),
                                    description:
                                        _descriptionController.text.trim()));

                                _titleController.clear();
                                _descriptionController.clear();
                              });
                            }
                          },
                          child: const Text("Add"))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 2,
                  child: ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        final Info todo = todoList[index];
                        return Card(
                          color: Colors.grey[200],
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text("${index + 1}"),
                            ),
                            title: Text(todoList[index].name),
                            subtitle: Text(todoList[index].description),
                            trailing: const Icon(
                              Icons.arrow_forward,
                              color: Colors.grey,
                            ),
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: const Text("Alert"),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  // Open a BottomSheet
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return UpdateTaskModal(
                                                          todo: todo,
                                                          onTodoUpdate:
                                                              (Info todo) {
                                                            updateTodo(
                                                                index,
                                                                todo.name,
                                                                todo.description);

                                                            setState(() {});
                                                          },
                                                        );
                                                      });
                                                },
                                                child: const Text("Edit")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    todoList.removeAt(index);
                                                  });
                                                },
                                                child: const Text("Delete"))
                                          ],
                                        )
                                      ],
                                    );
                                  }));
                            },
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  void updateTodo(int index, String todoName, String todoDetails) {
    todoList[index].name = todoName;
    todoList[index].description = todoDetails;
    setState(() {});
  }
}

class Info {
  String name;
  String description;
  Info({required this.name, required this.description});
}
