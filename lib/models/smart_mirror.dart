import 'dart:async';
import 'dart:math';

import 'connectable.dart';

class SmartMirror implements Connectable {
  @override
  ConnectionState connectionState;
  String name = '스마트 미러';

  SmartMirror() : connectionState = ConnectionState.none;

  @override
  String getMessage() {
    return name + msgFromConnectionState(connectionState);
  }

  @override
  void setConnectionStateRandom() {
    var randomState = ConnectionState.values.elementAt(Random().nextInt(100) % 4);
    connectionState = randomState;
  }
}
