import 'dart:math';

import 'package:flutter/material.dart';
import 'badge.dart';

enum MsgStatus {
  sent,
  seen,
  received,
}

class ChatTrailling extends StatelessWidget {
  final String msgTime;
  final bool muted;
  final MsgStatus msgStatus;
  Map<MsgStatus, Widget> msgStatusIcon;
  static const double iconSize = 16;
  Widget mutedIcon;

  ChatTrailling({
    this.msgTime,
    this.muted,
    this.msgStatus = MsgStatus.received,
  }) {
    if (muted == false) {
      msgStatusIcon = {
        MsgStatus.sent: Container(
          child: Icon(
            Icons.check_circle_outline,
            color: Color(0xffc1c5cb),
            size: iconSize,
          ),
        ),
        MsgStatus.seen: Container(
          child: Icon(
            Icons.check_circle,
            color: Color(0xff0d99fd),
            size: iconSize,
          ),
        ),
        MsgStatus.received: Container(
          child: Icon(
            Icons.check_circle,
            color: Color(0xffc1c5cb),
            size: iconSize,
          ),
        ),
      };
    } else {
      //notifications_off
      mutedIcon = Container(
        child: Icon(
          Icons.notifications_off,
          color: Color(0xffc1c5cb),
          size: iconSize,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: muted == true ? mutedIcon : msgStatusIcon[msgStatus],
        )
      ],
    );
  }
}
