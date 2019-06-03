import 'package:flutter/material.dart';
import 'package:messenger_clone/widgets/appBar_action_icon.dart';
import 'package:messenger_clone/widgets/msg_status_icons.dart';
import 'package:messenger_clone/widgets/online_avatar.dart';

import 'widgets/badge.dart';

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
            msgContainer(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                true),
            msgContainer(
                "Sit amet facilisis magna etiam tempor. Cursus metus aliquam eleifend mi in nulla",
                false),
            msgContainer(
                "Ac ut consequat semper viverra nam libero justo laoreet sit. Malesuada fames ac turpis egestas ",
                true),
            msgContainer(
                "Ac ut consequat semper viverra nam libero justo laoreet sit. Malesuada fames Consectetur adipiscing elit ut aliquam. Fringilla urna porttitor rhoncus dolor purus non",
                false),
            msgContainer(
                "Ultrices tincidunt arcu non sodales neque. Viverra accumsan in nisl nisi scelerisque. Consectetur adipiscing elit ut aliquam. Fringilla urna porttitor rhoncus dolor purus non",
                false,
                showAvatar: true),
            msgContainer(
                "Quis viverra nibh cras pulvinar mattis nunc. Ultricies mi eget mauris",
                true),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 55,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              ...bottomIcons(),
              Container(
                width: 160,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15),
                    hintText: "Aa",
                    filled: true,
                    fillColor: Color(0xffefefef),
                    suffixIcon: Icon(
                      Icons.sentiment_satisfied,
                      color: Color(0xff0f84fd),
                    ),
                    // fillColor: Colors.red,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              Icon(Icons.thumb_up, size: 28, color: Color(0xff0f84fd))
            ],
          ),
        ),
      ),
    );
  }

  Row msgContainer(String msg, bool sentByUser, {bool showAvatar = false}) {
    Map msgConfig = {
      true: {
        "backgroundColor": Color(0xff0f84fd),
        "textColor": Colors.white,
        "rowAlignment": MainAxisAlignment.end,
        "msgStatusIcon": Container(
            padding: EdgeInsets.all(2),
            child: MsgStatusIcon.msgReceived(size: 14)),
        "containerBorder": BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        "msgAddReaction": Container(),
        "userAvatar": Container(),
      },
      false: {
        "backgroundColor": Color(0xffefefef),
        // "backgroundColor": Colors.red,
        "textColor": Colors.black,
        "rowAlignment": MainAxisAlignment.start,
        "msgStatusIcon": Container(),
        "containerBorder": BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        "msgAddReaction": Row(
          children: <Widget>[
            Icon(Icons.mood, size: 14, color: Color(0xffbfc3c8)),
            Icon(Icons.add, size: 14, color: Color(0xffbfc3c8)),
          ],
        ),
      }
    };

    if (showAvatar && sentByUser == false) {
      msgConfig[false]["userAvatar"] = Padding(
        padding: EdgeInsets.only(left: 10, right: 6),
        child: onlineAvatar(16,
            badgeAlignFactor: Size(2.7, 3),
            avatarAlignFactor: Size(1, 3.3),
            badgePadding: 2.5,
            borderPadding: 1.5),
      );
    } else {
      msgConfig[false]["userAvatar"] = Container(
        padding: EdgeInsets.only(left: 42, right: 6),
      );
    }

    var config = msgConfig[sentByUser];

    return Row(
      mainAxisAlignment: config["rowAlignment"],
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        config["userAvatar"],
        Column(
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
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: config["msgAddReaction"],
            )
          ],
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

  List bottomIcons() {
    const double iconSize = 27;
    return [
      Icon(Icons.more_horiz, size: iconSize, color: Color(0xff0f84fd)),
      Icon(Icons.photo_camera, size: iconSize, color: Color(0xff0f84fd)),
      Icon(Icons.photo, size: iconSize, color: Color(0xff0f84fd)),
      Icon(Icons.mic, size: iconSize, color: Color(0xff0f84fd)),
    ];
  }
}
