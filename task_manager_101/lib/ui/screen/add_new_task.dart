import 'package:flutter/material.dart';
import 'package:task_manager_101/ui/widget/body_background.dart';
import 'package:task_manager_101/ui/widget/profile_summary_card.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ProfileSummaryCard(),
          Expanded(
              child: BodyBackground(
                child: SingleChildScrollView(
                          child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New Task',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'subject name'),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(hintText: 'Description'),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.arrow_circle_right_outlined)),
                      )
                    ]),
                          ),
                        ),
              ))
        
        
        ]),
      ),
    );
  }
}
