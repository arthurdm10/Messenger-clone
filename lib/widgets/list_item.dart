import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Widget title;
  final Widget subTitle;
  final Widget traillingWidget;

  ListItem({this.title, this.subTitle, this.traillingWidget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/avatar_placeholder2.png"),
          maxRadius: 24.0,
        ),
      ),
      title: title,
      subtitle: subTitle,
      trailing: traillingWidget,
    );
  }
}
