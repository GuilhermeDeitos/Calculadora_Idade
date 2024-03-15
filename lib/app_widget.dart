import 'package:flutter/material.dart';
import 'package:ola_mundo/home_page.dart';
import 'package:ola_mundo/app_controller.dart';
// StatelessWidget é um widget que não tem estado
class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({super.key, required this.title});


  @override
  Widget build(BuildContext context) { // build é o método que constroi o widget
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          home: HomePage()
      );
      }
    );
  }
}