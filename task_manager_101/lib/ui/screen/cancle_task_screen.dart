import 'package:flutter/material.dart';
import 'package:task_manager_101/ui/widget/profile_summary_card.dart';
import 'package:task_manager_101/ui/widget/task_item_card.dart';

class CancelTasksScreen extends StatefulWidget {
  const CancelTasksScreen({super.key});

  @override
  State<CancelTasksScreen> createState() => _CancelTasksScreenState();
}

class _CancelTasksScreenState extends State<CancelTasksScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummaryCard(),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                   // return TaskItemCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}