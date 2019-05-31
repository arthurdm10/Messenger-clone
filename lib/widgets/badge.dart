import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Widget child;
  final EdgeInsets padding;

  const Badge(
      {Key key,
      this.child,
      this.backgroundColor,
      this.textColor = Colors.white,
      this.padding = const EdgeInsets.all(5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}
