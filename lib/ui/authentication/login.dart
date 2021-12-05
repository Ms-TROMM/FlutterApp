import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ms_tromm/ui/authentication/change_password.dart';
import 'package:ms_tromm/ui/authentication/signup.dart';
import 'package:ms_tromm/ui/authentication/validators.dart';
import 'package:ms_tromm/ui/home/home.dart';
import 'package:ms_tromm/ui/widgets/logo.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(edgeInsets: EdgeInsets.fromLTRB(24, 0, 24, 24)),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _textInputWithTitle('이메일'),
                    _textInputWithTitle('비밀번호'),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: _loginButton())
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: '회원가입',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline)),
                  const TextSpan(text: ' 혹은 '),
                  TextSpan(
                      text: '비밀번호 변경',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePasswordPage()));
                        },
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline)),
                  const TextSpan(text: '을 원하시나요?'),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  _loginButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: TrommButton(
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // FIXME
          }
          // just navigate for now
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const HomePage()));
        },
        text: '로그인'
      )
    );
  }

  _textInputWithTitle(String title) {
    late TextFormField field;
    if (title == '이메일') {
      field = _emailTextFormField();
    } else {
      field = _passwordTextFormField();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(title),
          ),
          field
        ],
      ),
    );
  }

  _emailTextFormField() {
    return TextFormField(
      enableSuggestions: true,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: '', isDense: true),
      validator: (value) {
        if (value!.isEmpty) {
          return "이메일을 입력해주세요";
        } else if (!value.isValidEmail()) {
          return "유효한 이메일 형식이 아닙니다";
        } else {
          return null;
        }
      },
    );
  }

  _passwordTextFormField() {
    return TextFormField(
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: '',
        isDense: true,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "비밀번호를 입력해주세요";
        } else {
          return null;
        }
      },
    );
  }

  // _logo() {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
  //     child: _logoColor()
  //   );
  // }
  //
  // _logoColor() {
  //   return const Text.rich(
  //     TextSpan(children: [
  //       TextSpan(
  //           text: 'Ms.',
  //           style: TextStyle(
  //               fontFamily: 'jalnan',
  //               fontWeight: FontWeight.bold,
  //               fontSize: 40,
  //               color: Colors.grey)),
  //       TextSpan(
  //           text: 'TROMM',
  //           style: TextStyle(
  //               fontFamily: 'jalnan',
  //               fontWeight: FontWeight.bold,
  //               fontSize: 40,
  //               color: Colors.blue)),
  //     ]),
  //   );
  // }
}
