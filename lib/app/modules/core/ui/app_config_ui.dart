
import 'package:flutter/material.dart';

class AppConfigUi {
  AppConfigUi._(); //Ninguem mais consegue chamar essa classe tipo (new AppConfigUi())


  static const MaterialColor _primarySwatch = MaterialColor(0xFF0066B0, {
    50: Color(0xFF005c9e),
    100: Color(0xFF00528d),
    200: Color(0xFF00477b),
    300: Color(0xFF003d6a),
    400: Color(0xFF003358),
    500: Color(0xFF002946),
    600: Color(0xFF001f35),
    700: Color(0xFF001423),
    800: Color(0xFF000a12),
    900: Color(0xFF000000),
  });

  static final ThemeData theme = ThemeData(
    primarySwatch: _primarySwatch, //Cores do app
    primaryColor: const Color(0xFF0066B0), //Cor Primaria do app
    primaryColorLight: const Color(0xFF219FFF), //Cor secundaria do app
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)), //Cor da borda !!
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)), //Cor da borda quando o campo está selecionado !!  
      labelStyle: TextStyle(color: Colors.black) //Cor do label tanto de hintText quando de labelText(aquele que fica em cima do input)      
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      )
    )
  );

}