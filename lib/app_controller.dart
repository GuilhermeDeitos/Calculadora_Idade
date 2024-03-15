import 'package:flutter/material.dart';

class AppController extends ChangeNotifier{
  static AppController instance = AppController();
  bool isDarkTheme = false;
  changeTheme(){
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}

class InputController extends ChangeNotifier{
  static InputController instance = InputController();
  String anoNascimento = '';
  changeName(String value){    
    anoNascimento = value;
    notifyListeners();
  }
}

class ValidationController extends ChangeNotifier{
  static ValidationController instance = ValidationController();
  bool isValid = false;

  final verifyYear = RegExp(r'^[0-9]{4}$');
  showErrorAlert(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('Erro'),
          content: const Text('Ano de nascimento inválido'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            )
          ],
        );
      }
    );
  }
  validate(String value, BuildContext context) {
    if (!(verifyYear.hasMatch(value))) {
      showErrorAlert(context);
    } else {
      if(int.parse(value) > DateTime.now().year ||
        int.parse(value) < 1900){
          showErrorAlert(context);
          return;
        }
      isValid = true;
      notifyListeners();
    }
  }

  reset(){
    isValid = false;
    notifyListeners();
  }

  calculateAge(String value){
    return DateTime.now().year - int.parse(value);
  }
}

