import 'package:flutter/material.dart';

//the button wil take 3 parameter : the icon , the action title and the color of the icon
Widget actionButton(IconData icon, String actionTitle, Color iconColor , double iconSize) {
  return Expanded(
    child: FlatButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      label: Text(
        actionTitle,
        style: TextStyle(
          color: Colors.black,
          fontSize: 9
        ),
      ),
    ),
  );
}