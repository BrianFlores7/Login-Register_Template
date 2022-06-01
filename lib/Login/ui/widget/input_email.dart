
import 'package:flutter/material.dart';
import 'package:memry_test/colors/colors_views.dart';

class InputEmail extends StatelessWidget {
  const InputEmail({
    Key? key,
    required TextEditingController textControllerEmail,
  })  : _textControllerEmail = textControllerEmail,
        super(key: key);

  final TextEditingController _textControllerEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'E-mail',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _textControllerEmail,
              style: (const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400)),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.white,
              obscureText: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: ColorsViews.fill_color,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsViews.border_color, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
