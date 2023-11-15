import 'package:flutter/material.dart';
import 'package:task_manager_101/ui/controller/auth_controller.dart';
import 'package:task_manager_101/ui/screen/login_screen.dart';

import '../screen/edit_profile_screen.dart';
class ProfileSummaryCard extends StatefulWidget {
  const ProfileSummaryCard({
    super.key,this.enableOntap=true
  });

  final bool enableOntap ;

  @override
  State<ProfileSummaryCard> createState() => _ProfileSummaryCardState();
}

class _ProfileSummaryCardState extends State<ProfileSummaryCard> {
  @override
  Widget build(BuildContext context) {
    return   ListTile(
      onTap: (){
       if(widget.enableOntap)
       {
         Navigator.push(context,
        MaterialPageRoute(builder: (context) => const EditProfileScreen()));
       }
      },
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(
        fullName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
         AuthController.user?.email??" ",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          AuthController.claerSaveCheceData().then((_) {
            if (mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (route) => false,
              );
            }
          });
        },
        icon: const Icon(Icons.logout_outlined),
      ),

      tileColor: Colors.green[700],
    );
  }

  String get fullName{
    return "${AuthController.user?.firstName ?? ''}  ${AuthController.user!.lastName?? ''}";

  }
}