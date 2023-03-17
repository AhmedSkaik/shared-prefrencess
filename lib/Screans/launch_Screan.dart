import 'package:flutter/material.dart';
import 'package:sherd_pref_app/Shared_pref/Shared_pref_controller.dart';


class LaunchScrean extends StatefulWidget {
  const LaunchScrean({Key? key}) : super(key: key);

  @override
  State<LaunchScrean> createState() => _LaunchScreanState();
}

class _LaunchScreanState extends State<LaunchScrean> {
  @override
  void initState() {
   super.initState();
   Future.delayed(Duration(seconds: 3),(){
     String route=SharedPrefController().logedIn ? 'home_Screan' : 'login_Screan';
     Navigator.pushReplacementNamed(context, route);
   });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Colors.blue.shade300,
              Colors.pink.shade300,
            ]
          )
        ),
        child:  const Text('FLUTTER APP'),
      ) ,
    );
  }


}
