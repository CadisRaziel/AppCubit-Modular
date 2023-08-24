import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//B -> nosso  bloc
//StateStreamable<S> -> implementação do ESTADO do bloc cubit "abstract class BlocBase<State> implements StateStreamableSource<State>, Emittable<State>, ErrorSink"
//S -> ESTADO (OBject)

class ButtonWithLoader<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;
  final VoidCallback onPressed;
  final String label;
  const ButtonWithLoader(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.selector,
      required this.bloc});

  ///Botão que se transforma em um loader
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: BlocSelector<B, S, bool>(
          bloc: bloc,
          selector: selector,
          builder: (context, showLoading) {
            if (!showLoading) {
              return Text(label);
            }

            return Stack(
              alignment: Alignment.center,
              children: [
                Text(label),
                const Align(
                    alignment: Alignment.centerRight,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ))
              ],
            );
          },
        ));
  }
}
