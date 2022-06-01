import 'package:flutter/material.dart';
import 'package:memry_test/colors/colors_views.dart';
import '../../repository/login_api.dart';
import '../../repository/login_controller.dart';
import '../widget/if_dont_have_account.dart';
import '../widget/input_email.dart';
import '../widget/login_btn.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var loginController = LoginController(LoginApiRepository());
  TextEditingController _textControllerEmail = TextEditingController(text: "");
  TextEditingController _textControllerPassword =
      TextEditingController(text: "");
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorsViews.background_color,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 175,
                  height: 175,
                  child: Image.asset('assets/images/cs_logo.png'),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 8),
                child: Text(
                  'Iniciar sesion',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Inicie sesion para continuar.',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
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
                          color: Colors.white, fontWeight: FontWeight.w400)),
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
                          borderSide: BorderSide(
                              color: ColorsViews.border_color, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              LoginBtn(
                  textControllerEmail: _textControllerEmail,
                  textControllerPassword: _textControllerPassword,
                  loginController: loginController),
              const Center(
                child: Text(
                  '¿Olvido su contraseña?',
                  style: TextStyle(color: ColorsViews.border_color),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const IfDontHaveAccount()
            ],
          ),
        ),
      ),
    );
  }
}
