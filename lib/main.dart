import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:memry_test/Home/success.dart';
import 'package:memry_test/Login/ui/screen/login.dart';
import 'package:memry_test/Register/ui/screen/sign_up.dart';
import 'Login/ui/screen/login.dart';
import 'colors/colors_views.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: ColorsViews.background_color,
      ),
      builder: EasyLoading.init(),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/register_page': (context) => CreateAccount(),
        '/success': (context) => SuccessScreen(),
      },
    );
  }
}
