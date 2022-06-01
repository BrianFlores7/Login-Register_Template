import 'package:flutter/material.dart';
import 'package:memry_test/colors/colors_views.dart';

class If_have_account extends StatelessWidget {
  const If_have_account({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿Ya tienes una cuenta?',
          style: TextStyle(
              color: ColorsViews.grey_word, fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
          child: const Text('Iniciar sesion',
              style: TextStyle(
                color: ColorsViews.blue_word,
              )),
        )
      ],
    );
  }
}

