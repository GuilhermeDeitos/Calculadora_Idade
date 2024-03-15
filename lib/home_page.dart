import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

// Usar o StatefulWidget quando precisar alterar o estado do widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> names = ['Daniel', 'Maria', 'João'];
  bool isDarkTheme = false;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: Colors.purple[200],
        actions: [
          CustomSwitch()
        ],
      ),
      body: Center(
          child: CustomSwitch()
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          final int randomIndex = Random().nextInt(names.length);
          setState(() {
            name = names[randomIndex];
          });
        },
        child: const Text('Gerar nome'),
      ),
    );
  }
}


class CustomSwitch extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value){
        AppController.instance.changeTheme();
      },
    );
  }
}