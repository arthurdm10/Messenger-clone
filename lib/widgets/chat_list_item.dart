import 'package:flutter/material.dart';

import 'chat_trailling.dart';
import 'list_item.dart';

class ChatListItem extends StatelessWidget {
  ChatTrailling chatTrailling;
  final String chatName;
  final String msgTime;
  final String heroTag;
  final Widget msg;

  ChatListItem({
    Key key,
    this.chatName,
    this.msg,
    this.heroTag,
    this.msgTime,
    bool muted = false,
    MsgStatus msgStatus = MsgStatus.received,
  }) : super(key: key) {
    chatTrailling = ChatTrailling(
      msgTime: msgTime,
      muted: muted,
      msgStatus: msgStatus,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListItem(
      title: Text(
        chatName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subTitle: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(maxWidth: 210),
            child: msg,
          ),
          Container(
            child: Text(
              ' · $msgTime',
            ),
          ),
        ],
      ),
      traillingWidget: chatTrailling,
    );
  }
}
