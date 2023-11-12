import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Task Title',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            
            ),),
            Text('Description of the task goes here . Description of task is here'),
            Text('Data 12-10-2023'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text('New',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),

                Wrap(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_outlined)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}



