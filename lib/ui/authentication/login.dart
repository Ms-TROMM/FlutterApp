import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ms_tromm/ui/theme/colors.dart';

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
            _logo(),
            Form(
              key: _formKey,
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
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: '회원가입',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline)),
                  TextSpan(text: ' 혹은 '),
                  TextSpan(
                      text: '비밀번호 변경',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline)),
                  TextSpan(text: '을 원하시나요?'),

                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  _loginButton() {
    return MaterialButton(
      height: 42,
      minWidth: double.infinity,
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logging In ...')),
          );
        }
      },
      child: const Text('로그인',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      color: MyColor.secondaryDark2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
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
      padding: const EdgeInsets.only(bottom: 16.0),
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
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: '',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "이메일을 입력해주세요";
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
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: '',
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

  _logo() {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Text("Ms. TROMM",
          style: TextStyle(
              fontFamily: 'jalnan', fontWeight: FontWeight.bold, fontSize: 40)),
    );
  }
}
