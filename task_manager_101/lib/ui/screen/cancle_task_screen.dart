import 'package:flutter/material.dart';

class CancelTasksScreen extends StatefulWidget {
  const CancelTasksScreen({super.key});

  @override
  State<CancelTasksScreen> createState() => _CancelTasksScreenState();
}

class _CancelTasksScreenState extends State<CancelTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('cancel Tasks'),
      ),
    );
  }
}