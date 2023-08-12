import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobtimer/app/modules/services/auth/auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<void> signIn() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    //*Quando logamos pelo google, firebase, faceId, o firebase cria a conta para o usuario !
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();

    //*Se eu apenas fazer o signOut não sera o suficiente, pois na proxima vez que for realizar o login o firebase nao vai apresenta a janela para escolhe o email
    //*Por isso precisamos desconectar o usuario do firebase
    GoogleSignIn().disconnect();
  }
}
