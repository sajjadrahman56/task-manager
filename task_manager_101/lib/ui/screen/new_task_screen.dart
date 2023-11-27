import 'package:flutter/material.dart';
import 'package:task_manager_101/ui/screen/add_new_task.dart';
import 'package:task_manager_101/ui/widget/profile_summary_card.dart';
import 'package:task_manager_101/ui/widget/summary_card.dart';
import 'package:task_manager_101/ui/widget/task_item_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  bool _getNewTaskInProgress = false;
  Future<void> getNewTask() async {
    _getNewTaskInProgress = true;
    if(mounted){
      setState(() {
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddNewTask()));
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: Column(
        children: [
          ProfileSummaryCard(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: [
                  SummaryCard(
                    count: '9',
                    title: 'New Task',
                  ),
                  SummaryCard(
                    count: '9',
                    title: 'In Progress',
                  ),
                  SummaryCard(
                    count: '9',
                    title: 'Completed',
                  ),
                  SummaryCard(
                    count: '9',
                    title: 'Cancelled',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskItemCard();
                }),
          )
        ],
      )),
    );
  }
}
