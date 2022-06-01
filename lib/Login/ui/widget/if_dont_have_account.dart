
import 'package:flutter/material.dart';

import '../../../colors/colors_views.dart';

class IfDontHaveAccount extends StatelessWidget {
  const IfDontHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(
              color: ColorsViews.grey_word,
              fontWeight: FontWeight.w400),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register_page');
          },
          child: const Text(
            'Registrarse',
            style: TextStyle(
              color: ColorsViews.border_color,
            ),
          ),
        )
      ],
    );
  }
}
