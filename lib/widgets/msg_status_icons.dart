import 'package:flutter/material.dart';

class MsgStatusIcon {
  static const double iconSize = 19;

  static Icon msgSent({double size = iconSize}) => Icon(
        Icons.check_circle_outline,
        color: Color(0xffc1c5cb),
        size: iconSize,
      );

  static Icon msgSeen({double size = iconSize}) => Icon(
        Icons.check_circle,
        color: Color(0xff0d99fd),
        size: iconSize,
      );

  static Icon msgReceived({double size = iconSize}) => Icon(
        Icons.check_circle,
        color: Color(0xffc1c5cb),
        size: size,
      );
}
