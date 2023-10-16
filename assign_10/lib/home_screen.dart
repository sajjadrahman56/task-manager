import 'package:assign_10/edit_data.dart';
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
                        height: 15,
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
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
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
                          child: const Text(
                            "Add",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))
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
                              child: Text(
                                "${index + 1}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              backgroundColor:
                                  (index % 2) == 0 ? Colors.red : Colors.blue,
                            ),
                            title: Text(
                              todoList[index].name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            subtitle: Text(todoList[index].description),
                            trailing: const Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
                            ),
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      title: Center(child: const Text("Alert")),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                // Calculate the desired height based on the content and screen size
                                                double sheetHeight = MediaQuery
                                                            .of(context)
                                                        .size
                                                        .height *
                                                    0.5; // You can adjust the 0.5 factor according to your preference

                                                showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (context) {
                                                    return Container(
                                                      height:
                                                          sheetHeight, // Set the calculated height here
                                                      child: UpdateTaskModal(
                                                        todo: todo,
                                                        onTodoUpdate:
                                                            (Info todo) {
                                                          updateTodo(
                                                              index,
                                                              todo.name,
                                                              todo.description);
                                                          setState(() {});
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: const Text("Edit"),
                                            ),
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
