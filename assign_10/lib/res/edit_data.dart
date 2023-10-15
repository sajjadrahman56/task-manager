import 'package:api_test/res/home_screen.dart';
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Update todo',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
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
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Info todo = Info(
                        name: todoTEController.text.trim(),
                        description: todoTEController2.text.trim());

                    widget.onTodoUpdate(todo);
                  },
                  child: const Text('Update'),
                )),
          ],
        ),
      ),
    );
  }
}
