import 'package:flutter/material.dart';

class AppBarAcionIcon extends StatelessWidget {
  final IconData iconData;
  final GestureTapCallback onTap;
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;
  final EdgeInsets containerPadding;

  const AppBarAcionIcon({
    this.iconData,
    this.onTap,
    this.iconSize = 24,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.containerPadding = const EdgeInsets.only(
      top: 12.0,
      bottom: 12.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      padding: containerPadding,
      margin: const EdgeInsets.only(right: 12.0),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            iconData,
            color: iconColor,
            size: iconSize,
          ),
        ),
        onTap: onTap != null ? onTap : () {},
      ),
    );
  }
}
