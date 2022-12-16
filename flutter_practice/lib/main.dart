import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:flutter_practice/pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/', // this is 'root'
      routes: {
        '/HomePage': (context) => HomePage(),
        // '/WelComePage': (context) => WelcomePage(),
      },
      home: WelcomePage(),
    );
  }
}
