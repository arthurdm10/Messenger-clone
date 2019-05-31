import 'package:flutter/material.dart';

import 'appBar_action_icon.dart';

AppBar mainAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          margin: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/avatar_placeholder.png"),
            maxRadius: 16.0,
          ),
        ),
        Text("Chats",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      ],
    ),
    actions: <Widget>[
      AppBarAcionIcon(
        iconData: Icons.camera_alt,
        iconColor: Colors.black,
        backgroundColor: Color(0xffefefef),
      ),
      AppBarAcionIcon(
        iconData: Icons.edit,
        iconColor: Colors.black,
        backgroundColor: Color(0xffefefef),
      )
    ],
  );
}
