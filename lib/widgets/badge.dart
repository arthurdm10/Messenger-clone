import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String value;
  final EdgeInsets padding;

  const Badge(
      {Key key,
      this.value,
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
      child: Text(value, style: TextStyle(color: textColor, fontSize: 11)),
    );
  }
}
