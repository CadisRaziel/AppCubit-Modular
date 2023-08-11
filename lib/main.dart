import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jobtimer/app/app_module.dart';
import 'package:jobtimer/app/app_widget.dart';
import 'package:jobtimer/firebase_options.dart';

void main() async {

  //*Para rodar o flutter antes de iniciar o projeto
  WidgetsFlutterBinding.ensureInitialized();

  //*Inicialização do firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}