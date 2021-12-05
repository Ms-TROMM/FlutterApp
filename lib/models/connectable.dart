import 'dart:ui';

class Connectable {
  ConnectionState connectionState = ConnectionState.none;

  void setConnectionStateRandom() {}

  String getMessage(){ return ''; }
}

enum ConnectionState { connecting, failed, success, none }

int colorFromConnectionState(ConnectionState state) {
  int ret = 0;
  switch (state) {
    case ConnectionState.success:
      ret = 0xff00ac00;
      break;
    case ConnectionState.failed:
      ret = 0xffff0000;
      break;
    case ConnectionState.connecting:
      ret = 0xff3988ff;
      break;
    case ConnectionState.none:
      ret = 0xff707070;
      break;
  }

  return ret;
}

String imagePathFromConnectionState(ConnectionState state) {
  if (state != ConnectionState.failed) {
    return 'assets/images/icon_awesome_wifi.png';
  } else {
    return 'assets/images/icon_open_reload.png';
  }
}

String msgFromConnectionState(ConnectionState state) {
  String ret = '';
  switch (state) {
    case ConnectionState.success:
      ret = ' 연결완료';
      break;
    case ConnectionState.failed:
      ret = ' 연결실패';
      break;
    case ConnectionState.connecting:
      ret = ' 연결중';
      break;
    case ConnectionState.none:
      ret = '와 연결';
      break;
  }

  return ret;
}
