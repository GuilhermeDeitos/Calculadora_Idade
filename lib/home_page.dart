import 'dart:math';

import 'package:flutter/material.dart';

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
  bool wasPressed = false;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: GestureDetector(
          child: Text(
            (wasPressed) ? 'Olá $name' : 'Clique para gerar um nome',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          final int randomIndex = Random().nextInt(names.length);
          wasPressed = true;
          setState(() {
            name = names[randomIndex];
          });
        },
        child: const Text('Gerar nome'),
      ),
    );
  }
}
