import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Idade'),
        backgroundColor: Colors.purple[200],
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(AppController.instance.isDarkTheme ? 'Dark' : 'Light'),
                const SizedBox(width: 10),
                CustomSwitch(),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.cyan,
              child: Center(
                child: AgeText(),
              ),
            ),
            const SizedBox(height: 20),
            CustomInput(),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}

class CustomInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      onChanged: (value) {
        InputController.instance.changeName(value);
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextButton(
        onPressed: () {
          ValidationController.instance.validate(
            InputController.instance.anoNascimento,
            context,
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        child: const Text('Calcular Idade'),
      ),
    );
  }
}

class AgeText extends StatefulWidget {
  @override
  _AgeTextState createState() => _AgeTextState();
}

class _AgeTextState extends State<AgeText> {
  String ageText = 'Insira seu ano de nascimento para calcularmos sua idade';

  @override
  Widget build(BuildContext context) {
    return Text(
      ageText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  initState() {
    super.initState();
    ValidationController.instance.addListener(updateAgeText);
  }

  @override
  dispose() {
    ValidationController.instance.removeListener(updateAgeText);
    super.dispose();
  }

  updateAgeText() {
    setState(() {
      if (InputController.instance.anoNascimento.isNotEmpty &&
          ValidationController.instance.isValid) {
        ageText = 'Sua Idade: ${ValidationController.instance.calculateAge(InputController.instance.anoNascimento)}';
      } else {
        ageText = 'Insira seu ano de nascimento para calcularmos sua idade';
      }
    });
  }
}