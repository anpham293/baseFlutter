import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void Alert(String title, String content, BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: new Text(title),
            content: new Text(content),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Đóng!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
}
