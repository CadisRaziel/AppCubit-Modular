import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
  //?O firebaseAUth tenta mante o usuario logado ao maximo
  //*O firebase auth fica escutando quando a gente faz o login ou não (é um listener)
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if(user == null){
        //*Se o usuário for nulo ele nao esta logado, ele vai para a tela de login
        Modular.to.navigate('/login');
      } else {
        //*Se o usuário não for nulo ele esta logado, ele vai para a tela de home
        Modular.to.navigate('/home');
      }
     });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF0092B9),
          Color(0xFF0167B2),
        ])),
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
