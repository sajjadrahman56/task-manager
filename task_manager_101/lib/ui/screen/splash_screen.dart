import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_101/ui/screen/login_screen.dart';
import 'package:task_manager_101/ui/screen/main_buttom_nav_screen.dart';
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
  void goToLogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token =  await prefs.getString('token');
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
       MaterialPageRoute(builder: (context)=> token == null ? const LoginScreen() :
       MainBottomNavScreen()
       ),
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