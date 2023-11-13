import 'package:flutter/material.dart';

import '../screen/edit_profile_screen.dart';
class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,this.enableOntap=true
  });

  final bool enableOntap ;
  @override
  Widget build(BuildContext context) {
    return   ListTile(
      onTap: (){
       if(enableOntap)
       {
         Navigator.push(context,
        MaterialPageRoute(builder: (context) => EditProfileScreen()));
       }
      },
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
      trailing: enableOntap ? Icon(Icons.arrow_forward) : null,
      tileColor: Colors.green[700],
    );
  }
}