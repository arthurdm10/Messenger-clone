import 'package:flutter/material.dart';

import 'appBar_action_icon.dart';

AppBar mainAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          margin: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/avatar_placeholder.png"),
            maxRadius: 19.0,
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
        containerPadding: EdgeInsets.all(3),
        iconData: Icons.camera_alt,
        iconColor: Colors.black,
        backgroundColor: Color(0xffefefef),
      ),
      AppBarAcionIcon(
        containerPadding: EdgeInsets.all(3),
        iconData: Icons.edit,
        iconColor: Colors.black,
        backgroundColor: Color(0xffefefef),
      )
    ],
  );
}
