import 'package:flutter/material.dart';
import 'package:messenger_clone/widgets/appBar_action_icon.dart';
import 'package:messenger_clone/widgets/msg_status_icons.dart';
import 'package:messenger_clone/widgets/online_avatar.dart';

class Chat extends StatelessWidget {
  final String chatTitle;
  const Chat({this.chatTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatAppBar(context),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(top: 5),
          children: <Widget>[
            msgContainer("PKDSAKOPAdkpopakOSK PDOASK PODAS", true),
            msgContainer("PKDSAKOPAdkpopakOSK PDOASK PODAS", false),
            msgContainer("PKDSAKOPAdkpopakOSK PDOASK PODAS", true),
            msgContainer("PKDSAKOPAdkpopakOSK PDOASK PODAS", false),
            msgContainer("PKDSAKOPAdkpopakOSK PDOASK PODAS", false),
            msgContainer("PKDSAKOPAdkpopakOSK PDOASK PODAS", false),
            msgContainer("PKDSAKOPAdkpopakOSK PDOASK PODAS", true),
            msgContainer("PKDSAKOPAdkpopakOSK PDOASK PODAS", false),
          ],
        ),
      ),
    );
  }

  Row msgContainer(String msg, bool sentByUser) {
    Map msgConfig = {
      true: {
        "backgroundColor": Color(0xff0f84fd),
        "textColor": Colors.white,
        "rowAlignment": MainAxisAlignment.end,
        "msgStatusIcon": Container(
            padding: EdgeInsets.all(2),
            child: MsgStatusIcon.msgReceived(size: 14)),
        "containerBorder": BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      },
      false: {
        "backgroudColor": Color(0xffefefef),
        "textColor": Colors.black,
        "rowAlignment": MainAxisAlignment.start,
        "msgStatusIcon": Container(),
        "containerBorder": BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      }
    };
    var config = msgConfig[sentByUser];

    return Row(
      mainAxisAlignment: config["rowAlignment"],
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(9),
          constraints: BoxConstraints(maxWidth: 180),
          decoration: BoxDecoration(
              color: config["backgroundColor"],
              borderRadius: config["containerBorder"]),
          child: Text(
            msg,
            style: TextStyle(color: config["textColor"]),
          ),
        ),
        config["msgStatusIcon"],
      ],
    );
  }

  AppBar chatAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 28,
        ),
        color: Color(0xff0f84fd),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      titleSpacing: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: onlineAvatar(
              16,
              badgePadding: 2.5,
              borderPadding: 3,
              badgeAlignFactor: Size(2.5, 2),
              avatarAlignFactor: Size(1.2, 2.5),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 4, top: 3),
                    child: Text(
                      chatTitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Active Now",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        AppBarActionIcon(
          iconData: Icons.phone,
          iconColor: Color(0xff0f84fd),
        ),
        AppBarActionIcon(
          iconData: Icons.videocam,
          iconColor: Color(0xff0f84fd),
        ),
        AppBarActionIcon(
          iconData: Icons.info,
          iconColor: Color(0xff0f84fd),
        ),
      ],
    );
  }
}
