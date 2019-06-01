import 'dart:math';

import 'package:flutter/material.dart';
import 'package:messenger_clone/widgets/msg_status_icons.dart';
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
  Widget mutedIcon;

  ChatTrailling({
    this.msgTime,
    this.muted,
    this.msgStatus = MsgStatus.received,
  }) {
    if (muted == false) {
      msgStatusIcon = {
        MsgStatus.sent: MsgStatusIcon.msgSent(),
        MsgStatus.seen: MsgStatusIcon.msgSeen(),
        MsgStatus.received: MsgStatusIcon.msgReceived(),
      };
    } else {
      //notifications_off
      mutedIcon = Container(
        child: Icon(
          Icons.notifications_off,
          color: Color(0xffc1c5cb),
          size: MsgStatusIcon.iconSize,
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
