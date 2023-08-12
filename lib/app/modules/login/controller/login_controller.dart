import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobtimer/app/modules/services/auth/auth_service.dart';

//*Parte do login_controller esta dentro do login_state.dart
part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  //*Tudo tem que passar pelo meu controller para ir para camada de serviço, por isso precisamos criar construtor
  // LoginController(super.initialState, this._authService);
  LoginController({required AuthService authService})
      : _authService = authService,
        super(const LoginState.initial());

  Future<void> signIn() async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      await _authService.signIn();
    } catch (e, s) {
      //?stackTrace -> linha onde deu o problema
      log("Erro ao realizar o login", error: e, stackTrace: s);
      emit(state.copyWith(
          status: LoginStatus.failure,
          errorMessage: "Erro ao realizar o login"));
    }
  }
}
