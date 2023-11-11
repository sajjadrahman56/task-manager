import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_101/ui/screen/login_screen.dart';
import 'package:task_manager_101/ui/widget/body_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    void initState(){
    super.initState();
    goToLogin();
  }
  void goToLogin(){
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
       MaterialPageRoute(builder: (context)=>const LoginScreen()),
       (route)=>false);
    } );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BodyBackground(
        child:  Center(
          child: SvgPicture.asset('assets/images/logo.svg',width: 200,)
        ),
      )
    );
  }
}