import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/authentication/validators.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
              enableSuggestions: true,
              autocorrect: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '이름',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "이름을 입력해주세요";
                } else if (!value.isValidName()) {
                  return "이름은 32글자를 초과할 수 없습니다";
                } else {
                  return null;
                }
              }),
          TextFormField(
              enableSuggestions: true,
              autocorrect: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '이메일',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "이메일을 입력해주세요";
                } else if (!value.isValidEmail()) {
                  return "유효한 이메일 형식이 아닙니다";
                } else {
                  return null;
                }
              }),
          TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '비밀번호',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "비밀번호를 입력해주세요";
                } else {
                  return null;
                }
              }),
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '비밀번호 확인',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "비밀번호를 다시 한 번 입력해주세요";
              } else {
                return null;
              }
            },
          )
        ],
      ),
    );
  }
}
