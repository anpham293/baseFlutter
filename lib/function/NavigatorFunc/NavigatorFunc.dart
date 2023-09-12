import 'package:flutter/cupertino.dart';

void back(BuildContext context){
  Navigator.pop(context);
}
void returnHome(BuildContext context){
  Navigator.of(context).popUntil((route) => route.isFirst);
}