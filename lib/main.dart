import 'package:dtmoney/mobile/pages/home_mobile_page.dart';
import 'package:dtmoney/web/pages/home_web_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool isRunningOnWeb() {
    // Verifica se o aplicativo está sendo executado na plataforma web
    return kIsWeb;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Color(0xff00875F),
            ),
          ),
        ),
      ),
      home: isRunningOnWeb() ? const HomeWebPage() : const HomeMobilePage(),
    );
  }
}
