import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveFlatButton({@required this.text, @required this.handler});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoButton(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: handler,
            )
          : FlatButton(
              child: Text(
                'Choose Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: handler,
              textColor: Theme.of(context).primaryColor,
            ),
    );
  }
}
