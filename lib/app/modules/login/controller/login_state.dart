//*part of, pois uma classe bloc não vive sem um estado
//*Ou seja quando eu declaro 'part of' estou dizendo que essa classe faz parte de outra
//*fazemos isso para nao juntar tudo em um arquivo só pois fica ruim de dar manutenção
//*Ou seja vai te parte desse código dentro do login_controller e vice versa
part of 'login_controller.dart';


//!Repare que todo importe que tiver aqui dentro, vai ser importado no login_controller !!!

enum LoginStatus { initial, loading, failure }


class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage; //-> somente no momento do failure que eu apresento essa mensagem


  const LoginState._({
    required this.status,
    this.errorMessage,
  });

  const LoginState.initial() : this._(status: LoginStatus.initial);

  @override
  List<Object?> get props => [
    //*Get da classe Equatable para gerar o equals e identificar pelos atributos que nossa classe mudou
    status, errorMessage 
  ];
  

  //*Ao invés de dar um new, eu vou copiar o meu estado anterior para um novo
  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

