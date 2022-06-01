import 'package:flutter/material.dart';
import 'package:memry_test/colors/colors_views.dart';
import '../../repository/register_api.dart';
import '../../repository/register_controller.dart';
import '../widget/go_back_button.dart';
import '../widget/if_have_account.dart';
import '../widget/input_email.dart';
import '../widget/input_phone.dart';
import '../widget/register_btn.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _passwordVisible = false;

  var signInController = RegisterController(RegisterApiRepository());
  TextEditingController _textControllerEmail = TextEditingController(text: "");
  TextEditingController _textControllerPassword =
      TextEditingController(text: "");
  TextEditingController _textControllerPhone = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        leading: goBackButton(context),
        backgroundColor: ColorsViews.background_color
      ),
      backgroundColor: ColorsViews.background_color,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Text(
                'Crear una cuenta',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Rellene los siguientes campos.',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ),
            InputEmail(textControllerEmail: _textControllerEmail),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Contraseña',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _textControllerPassword,
                    style: (const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    )),
                    obscureText: _passwordVisible,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: ColorsViews.fill_color,
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: ColorsViews.hide_password,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorsViews.border_color, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            inputPhone(textControllerPhone: _textControllerPhone),
            registerBtn(
              textControllerEmail: _textControllerEmail,
              textControllerPassword: _textControllerPassword,
              textControllerPhone: _textControllerPhone,
              signInController: signInController,
            ),
            const SizedBox(
              height: 100,
            ),
            const If_have_account()
          ],
        ),
      ),
    );
  }
}