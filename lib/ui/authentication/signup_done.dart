import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/authentication/login.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class SignUpDoneScreen extends StatefulWidget {
  const SignUpDoneScreen({Key? key}) : super(key: key);

  @override
  _SignUpDoneScreenState createState() => _SignUpDoneScreenState();
}

class _SignUpDoneScreenState extends State<SignUpDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Image.asset('assets/images/signup_success.png',
                fit: BoxFit.fill),
          ),
          const Text(
            '회원가입을 축하합니다!\n로그인 후 Ms.TROMM의 서비스를 이용해보세요.',
            textAlign: TextAlign.center,
            // style: Theme.of(context).textTheme.subtitle2, FIXME
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TrommButton(onPressed: (){
              // just navigate for now
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const LoginPage()));
            }, text: '로그인'),
          )
        ],
      ),
    );
  }
}
