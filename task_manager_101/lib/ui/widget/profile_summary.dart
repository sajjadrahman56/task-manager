import 'package:flutter/material.dart';
class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(
        'Sajjad Rahman',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        'sajjadrahman1020@gmail.com',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: Icon(Icons.more_vert),
      tileColor: Colors.green[700],
    );
  }
}