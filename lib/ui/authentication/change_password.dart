import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/authentication/utils.dart';
import 'package:ms_tromm/ui/authentication/validators.dart';
import 'package:ms_tromm/ui/theme/colors.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('비밀번호 변경'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textInputWithTitle(Utils.EMAIL_FIELD),
                _textInputWithTitle(Utils.PASSWORD_FIELD),
                _textInputWithTitle(Utils.PASSWORD_CHECK_FIELD),
                _changePasswordButton()
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
      case Utils.EMAIL_FIELD:
        field = _emailTextInputField();
        break;
      case Utils.PASSWORD_FIELD:
        field = _passwordTextInputField();
        break;
      case Utils.PASSWORD_CHECK_FIELD:
        field = _passwordCheckTextInputField();
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
          hintText: '새로운 비밀번호',
          isDense: true,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "새로운 비밀번호를 입력해주세요";
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

  _changePasswordButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: MaterialButton(
        height: 42,
        minWidth: double.infinity,
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Changing Password ...')),
            );
          }
        },
        child: const Text('비밀번호 변경',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        color: MyColor.secondaryDark2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
