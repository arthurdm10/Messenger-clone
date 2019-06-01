import 'package:flutter/material.dart';

import 'badge.dart';

Widget onlineAvatar(
  double avatarRadius, {
  Size badgeAlignFactor = const Size(2.5, 1.8),
  Size avatarAlignFactor = const Size(1, 0.9),
  double badgePadding = 5,
  double borderPadding = 3,
}) {
  return Stack(
    children: [
      Align(
        widthFactor: avatarAlignFactor.width,
        heightFactor: avatarAlignFactor.height,
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/avatar_placeholder.png"),
          maxRadius: avatarRadius,
        ),
      ),
      Align(
        heightFactor: badgeAlignFactor.height,
        widthFactor: badgeAlignFactor.width,
        alignment: Alignment.bottomRight,
        child: Badge(
          padding: EdgeInsets.all(borderPadding),
          backgroundColor: Colors.white,
          child: Badge(
            padding: EdgeInsets.all(badgePadding),
            backgroundColor: Color(0xff4ae83c),
            child: Text(" "),
          ),
        ),
      ),
    ],
  );
}
