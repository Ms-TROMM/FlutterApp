import 'dart:async';
import 'dart:math';

import 'package:ms_tromm/models/connectable.dart';

class Styler implements Connectable {
  @override
  ConnectionState connectionState;
  String name = '스타일러';

  Styler() : connectionState = ConnectionState.none;

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
