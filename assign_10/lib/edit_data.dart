import 'package:assign_10/home_screen.dart';
import 'package:flutter/material.dart';

class UpdateTaskModal extends StatefulWidget {
  const UpdateTaskModal(
      {super.key, required this.todo, required this.onTodoUpdate});

  final Info todo;
  final Function(Info) onTodoUpdate;

  @override
  State<UpdateTaskModal> createState() => _UpdateTaskModalState();
}

class _UpdateTaskModalState extends State<UpdateTaskModal> {
  late TextEditingController todoTEController;
  late TextEditingController todoTEController2;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    todoTEController = TextEditingController(text: widget.todo.name);
    todoTEController2 = TextEditingController(text: widget.todo.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: todoTEController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your todo here',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
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
                  controller: todoTEController2,
                  decoration: const InputDecoration(
                    hintText: 'Enter your todo here',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter a value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Info todo = Info(
                            name: todoTEController.text.trim(),
                            description: todoTEController2.text.trim());

                        widget.onTodoUpdate(todo);
                      },
                      child: const Text('Edit Done',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
