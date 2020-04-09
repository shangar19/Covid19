import 'package:covidntn/home_page.dart';
import 'package:covidntn/injection.dart';
import 'package:covidntn/splash_screen/pages/splash_screen_page.dart';
import 'package:covidntn/style/them.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID19',
      theme: themedata,
      home: SplashScreen(),
    );
  }
 
}
