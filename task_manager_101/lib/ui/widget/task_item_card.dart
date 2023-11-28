import 'package:flutter/material.dart';
import 'package:task_manager_101/data/network_caller/ntwork_caller.dart';

import '../../data/model/task.dart';
import '../../data/network_caller/network_response.dart';
import '../../data/utility/utils.dart';

enum TaskStatus { New, Progress, Completed, Cancelled }

class TaskItemCard extends StatefulWidget {
  const TaskItemCard(
      {super.key, required this.task, required this.onStatusChane, required this.showProgeress});

  final Task task;
  final VoidCallback onStatusChane;
  final Function(bool) showProgeress;
  @override
  State<TaskItemCard> createState() => _TaskItemCardState();
}

class _TaskItemCardState extends State<TaskItemCard> {
  Future<void> updateStatus(String status) async {
    widget.showProgeress(true);
    final NetworkResponse response = await NetworkCaller()
        .getRequest(Urls.updateTaskStatus(widget.task.sId ?? '', status));
    if (response.isSuccess) {
      widget.onStatusChane();
    }

    widget.showProgeress(false);
  }

  Future<void> deleteStatus(String status) async {
    widget.showProgeress(true);
    final NetworkResponse response = await NetworkCaller()
        .getRequest(Urls.updateTaskStatus(widget.task.sId ?? '', status));
    if (response.isSuccess) {
      widget.onStatusChane();
    }

    widget.showProgeress(false);
  }
  hjd // 46 munite
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(widget.task.description ?? ''),
            Text('Data : ${widget.task.createdDate}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    widget.task.status ?? 'New',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
                Wrap(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_forever_outlined)),
                    IconButton(
                        onPressed: () {
                          showUpdateStatusModel();
                        },
                        icon: Icon(Icons.edit)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showUpdateStatusModel() {
    List<ListTile> items = TaskStatus.values.map((e) {
      return ListTile(
        title: Text('${e.name}'),
        onTap: () {
          updateStatus(e.name);
          Navigator.pop(context);
        },
      );
    }).toList();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Update Status'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: items,
            ),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.grey),
                      )),
                  TextButton(onPressed: () {}, child: Text('Update')),
                ],
              )
            ],
          );
        });
  }
}
