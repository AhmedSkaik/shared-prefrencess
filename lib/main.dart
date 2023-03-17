import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sherd_pref_app/Modals/User.dart';
import 'package:sherd_pref_app/Screans/home_Screan.dart';
import 'package:sherd_pref_app/Screans/launch_Screan.dart';
import 'package:sherd_pref_app/Screans/login_Screan.dart';
import 'package:sherd_pref_app/Shared_pref/Shared_pref_controller.dart';

import 'database/db_controller.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPrefances();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale:  Locale('er'),
      initialRoute: 'launch_Screan',
      routes: {
        'launch_Screan' : (context)=> const LaunchScrean(),
        'login_Screan' : (context)=> LoginScrean(),
        'home_Screan' : (context)=> const HomeScrean(),

      },
    );
  }



}
