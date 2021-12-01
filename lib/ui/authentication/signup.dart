import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ms_tromm/ui/authentication/signup_done.dart';
import 'package:ms_tromm/ui/authentication/utils.dart';
import 'package:ms_tromm/ui/authentication/validators.dart';
import 'package:ms_tromm/ui/theme/colors.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

enum Gender { male, female }

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textInputWithTitle(Utils.NAME_FIELD),
                _textInputWithTitle(Utils.EMAIL_FIELD),
                _textInputWithTitle(Utils.PASSWORD_FIELD),
                _textInputWithTitle(Utils.PASSWORD_CHECK_FIELD),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("성별"),
                      Row(
                        children: [
                          Radio<Gender>(
                            value: Gender.male,
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                          const Text("남자"),
                          Radio<Gender>(
                              value: Gender.female,
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                });
                              }),
                          const Text("여자")
                        ],
                      )
                    ],
                  ),
                ),
                _textInputWithTitle(Utils.BIRTH_DATE_FIELD),
                _signUpButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _textInputWithTitle(String title) {
    late TextFormField field;
    switch (title) {
      case Utils.NAME_FIELD:
        field = _nameTextInputField();
        break;
      case Utils.EMAIL_FIELD:
        field = _emailTextInputField();
        break;
      case Utils.PASSWORD_FIELD:
        field = _passwordTextInputField();
        break;
      case Utils.PASSWORD_CHECK_FIELD:
        field = _passwordCheckTextInputField();
        break;
      case Utils.BIRTH_DATE_FIELD:
        field = _birthDateCheckTextInputField();
        break;
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

  _nameTextInputField() {
    return TextFormField(
        enableSuggestions: true,
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: '이름', isDense: true),
        validator: (value) {
          if (value!.isEmpty) {
            return "이름을 입력해주세요";
          } else if (!value.isValidName()) {
            return "이름은 32글자를 초과할 수 없습니다";
          } else {
            return null;
          }
        });
  }

  _emailTextInputField() {
    return TextFormField(
        enableSuggestions: true,
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: '이메일', isDense: true),
        validator: (value) {
          if (value!.isEmpty) {
            return "이메일을 입력해주세요";
          } else if (!value.isValidEmail()) {
            return "유효한 이메일 형식이 아닙니다";
          } else {
            return null;
          }
        });
  }

  _passwordTextInputField() {
    return TextFormField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: '비밀번호',
          isDense: true,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "비밀번호를 입력해주세요";
          } else {
            return null;
          }
        });
  }

  _passwordCheckTextInputField() {
    return TextFormField(
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: '비밀번호 확인', isDense: true),
      validator: (value) {
        if (value!.isEmpty) {
          return "비밀번호를 다시 한 번 입력해주세요";
        } else {
          return null;
        }
      },
    );
  }

  _birthDateCheckTextInputField() {
    return TextFormField(
      enableSuggestions: false,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'ex. 1995', isDense: true),
      validator: (value) {
        if (value!.isEmpty) {
          return "출생년도를 입력해주세요";
        } else if (value.length != 4) {
          return "출생년도 자릿수가 잘못되었습니다.";
        } else {
          return null;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            // TODO Do something
          });
        }
      },
    );
  }

  _signUpButton() {
    return TrommButton(
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signing Up ...')),
            );
            // FIXME
          }
          // just navigate for now
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const SignUpDoneScreen()));
        },
        text: '회원가입');
  }
}
