import 'package:flutter/material.dart';
import 'package:sherd_pref_app/Shared_pref/Shared_pref_controller.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({Key? key}) : super(key: key);

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await _logout(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    bool cLeard = await SharedPrefController().clear();
    if (cLeard) {
      Navigator.pushReplacementNamed(context, 'login_Screan');
    }
  }
}
