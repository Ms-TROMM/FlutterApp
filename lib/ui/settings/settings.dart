import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/authentication/login.dart';
import 'package:ms_tromm/ui/settings/my_info_page.dart';
import 'package:ms_tromm/ui/settings/personal_info_policy.dart';
import 'package:ms_tromm/ui/settings/version_info_page.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: SettingsList(
        backgroundColor: Colors.white,
        sections: [
          SettingsSection(
            titlePadding: EdgeInsets.all(20),
            title: '계정',
            tiles: [
              SettingsTile(
                title: '내 정보',
                leading: Icon(Icons.account_circle),
                onPressed: (BuildContext context) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyInfoPage()));
                },
              ),
              SettingsTile.switchTile(
                title: '푸시알림',
                leading: Icon(Icons.alarm),
                switchValue: isSwitched,
                onToggle: (value) {
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            titlePadding: EdgeInsets.all(20),
            title: '기타',
            tiles: [
              SettingsTile(
                title: '약관',
                leading: Icon(Icons.format_list_numbered),
                onPressed: (BuildContext context) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalPolicy()));
                },
              ),
              SettingsTile(
                title: '버전전보',
                leading: Icon(Icons.info_outline),
                onPressed: (BuildContext context) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VersionPage()));
                },
              ),
              SettingsTile(
                title: '로그아웃',
                leading: Icon(Icons.exit_to_app),
                onPressed: (BuildContext context) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
