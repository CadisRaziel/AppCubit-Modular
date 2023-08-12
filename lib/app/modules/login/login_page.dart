import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobtimer/app/modules/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  const LoginPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      //!Como não estamos utilizando o provider com o bloc eu sempre preciso passar o bloc aqui e quem este bloc esta ouvindo
      bloc: controller,

      //*listenWhen só vai buildar algo se o status mudar
      //*Ou seja só executa o listenter se esse cara retornar true
      listenWhen: (previous, current) => previous.status != current.status,

      //*Listener para ficar ouvindo se o login vai dar erro ou não
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          final message = state.errorMessage ?? "Erro ao realizar o login";
          AsukaSnackbar.alert(message).show();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF0092B9),
            Color(0xFF0167B2),
          ])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  height: 49,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                    ),
                    onPressed: () {
                      controller.signIn();
                    },
                    child: Image.asset("assets/images/google.png"),
                  ),
                ),

                //*Vou extrair uma informação do meu status para saber se é loading ou não
                BlocSelector<LoginController, LoginState, bool>(
                  //! se eu nao passar a flag bloc aqui, ele vai ficar dando erro no scaffold, bizzaro né
                  //!isso acontece porque eu nao to usando o provider com o bloc, entao preciso passar o bloc para falar pra pagina quem esse bloc ta ouvindo
                  bloc: controller,
                  selector: (state) => state.status == LoginStatus.loading,
                  builder: (context, show) {
                    return Visibility(
                      visible: show,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
