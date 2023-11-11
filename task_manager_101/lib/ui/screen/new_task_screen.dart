import 'package:flutter/material.dart';
import 'package:task_manager_101/ui/widget/profile_summary.dart';
import 'package:task_manager_101/ui/widget/summary_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ProfileSummaryCard(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [       
                 SummaryCard(count:'9',title: 'New Task',),
                 SummaryCard(count:'9',title: 'In Progress',),
                 SummaryCard(count:'9',title: 'Completed',),
                 SummaryCard(count:'9',title: 'Cancelled',),
              ],
            ),
          )
        ],
      )),
    );
  }
}



