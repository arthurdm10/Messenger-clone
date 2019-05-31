import 'package:flutter/material.dart';
import 'package:messenger_clone/widgets/badge.dart';

Widget onlineContactItem(String contactName) {
  return Container(
    margin: EdgeInsets.only(left: 10),
    child: Column(
      children: <Widget>[
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/avatar_placeholder.png"),
            ),
            Align(
              heightFactor: 1.9,
              widthFactor: 2.5,
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Badge(
                  backgroundColor: Colors.green,
                  value: " ",
                ),
              ),
            ),
          ],
        ),
        Text(
          contactName,
          style: TextStyle(
            color: Colors.black45,
          ),
        )
      ],
    ),
  );
}

Widget addStoryItem() {
  return Container(
    margin: EdgeInsets.only(left: 10),
    child: Column(
      children: <Widget>[
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xffefefef),
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            Align(
              heightFactor: 1.9,
              widthFactor: 2.5,
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Badge(
                  backgroundColor: Colors.transparent,
                  value: " ",
                ),
              ),
            ),
          ],
        ),
        Text(
          "Your story",
          style: TextStyle(
            color: Colors.black45,
          ),
        )
      ],
    ),
  );
}
