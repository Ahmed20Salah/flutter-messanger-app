import 'package:flutter/material.dart';
import 'user.dart';

class Message{
  User user;
  String message;
  DateTime time;
  Message({@required this.user , @required this.message , this.time});
}