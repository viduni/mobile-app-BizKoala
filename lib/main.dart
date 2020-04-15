import 'package:flutter/material.dart';
import 'package:mobile_app/views/login.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',

  routes: {
    '/': (context) => Login(),
  },
));

