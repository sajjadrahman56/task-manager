import 'package:flutter/material.dart';
import 'package:task_manager_101/ui/widget/profile_summary_card.dart';
import '../widget/body_background.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(
              enableOntap: false,
            ),
            Expanded(
                child: BodyBackground(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Update Profile',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        imagePickerMethod(),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const TextField(
                          decoration: InputDecoration(hintText: 'Email'),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const TextField(
                          decoration: InputDecoration(hintText: 'First Name'),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const TextField(
                          decoration: InputDecoration(hintText: 'Last Name'),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const TextField(
                          decoration: InputDecoration(hintText: 'Mobile'),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const TextField(
                          decoration: InputDecoration(hintText: 'Password'),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Icon(Icons.arrow_circle_right_outlined)),
                        )
                      ]),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Container imagePickerMethod() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Container(
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  )),
              alignment: Alignment.center,
              child: const Text(
                'Photo',
                style: TextStyle(color: Colors.white),
              )),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.only(left: 8.0),
            child: const Text(' empty'),
          ),
        ),
      ]),
    );
  }
}
